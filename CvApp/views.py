from django.shortcuts import render, redirect, get_object_or_404
from .models import Personne, Cv, Loisir, Competence, ExperienceProfessionnelle, Formation, ModelCv, Langue
from django.contrib.auth import login, logout, authenticate
from django.core.mail import send_mail
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.forms.models import model_to_dict

# Create your views here.


def showCv(request):
    return render(request, 'formatCv/defaut.html')


def creerCv(request):

    return render(request, 'utilisateur/profil/templateCv/cv.html')


def index(request):
    # personnes = Personne.objects.all()
    data_list = Personne.objects.all()  # Fetch data from your model
    paginator = Paginator(data_list, 3)  # Show 10 items per page

    # Get the page number from the query string
    page_number = request.GET.get('page')
    try:
        personne = paginator.page(page_number)
    except PageNotAnInteger:
        # If page is not an integer, show the first page
        personne = paginator.page(1)
    except EmptyPage:
        personne = paginator.page(paginator.num_pages)

    return render(request, 'index.html', {'data': personne})

# enregistrer une nouvelle personne


def ajouterPersonne(request):
    if request.method == "POST":
        nom = request.POST.get('nom')
        prenoms = request.POST.get('prenoms')
        telephone = request.POST.get('telephone')
        email = request.POST.get('email')
        adresse = request.POST.get('adresse')
        mdp = request.POST.get('mdp')
        cmdp = request.POST.get('cmdp')
        photo = request.FILES.get('photo')

        # Vérifier si tous les champs obligatoires sont remplis
        if not all([nom, prenoms, telephone, email, adresse, mdp, cmdp]):
            messages.error(request, "Tous les champs doivent être remplis.")
            return redirect('ajouterPersonne')

        # Vérifier si les deux mots de passe sont identiques
        if mdp != cmdp:
            messages.error(request, "Les mots de passe ne correspondent pas.")
            return redirect('ajouterPersonne')

        # Enregistrer la personne
        try:
            personne = Personne.objects.create_user(
                nom=nom,
                prenom=prenoms,
                telephone=telephone,
                adresse=adresse,
                email=email,
                photo=photo,
            )
            # Définir et sécuriser le mot de passe
            personne.set_password(mdp)
            personne.save()

            Cv.objects.create(
                poste="",
                description="",
                photo="",
                personne=personne,
                modele=ModelCv.objects.get(numero=0)
            )

            # Connecter automatiquement l'utilisateur
            login(request, personne)

            # Redirection après création
            return redirect('profil')
        except Exception as e:
            print(f"Une erreur s'est produite : {str(e)} ")
            messages.error(request, f"Une erreur s'est produite : {str(e)}")
            return redirect('ajouterPersonne')

    return render(request, 'cv/ajouterPersonne.html')


# def description(request, personnde_id):
#     if request.method == "POST":
#         titre = request.POST.get('titre')
#         description = request.POST.get('description')
#         personne = get_object_or_404(Personne, id=personnde_id)

#         cv = Cv.objects.create(
#             poste=titre,
#             description=description,
#             personne=personne
#         )

#         # Garder l'id du cv en session
#         request.session["cv_id"] = cv.id
#         return redirect('formation')

#     else:
#         user_id = request.session.get("user")
#         if not user_id:
#             redirect("ajouterPersonne")
#         return render(request, 'cv/description.html')

@login_required
def description(request):
    if request.method == "POST":
        photo = request.POST.get('photo')
        titre = request.POST.get('titre')
        description = request.POST.get('description')
        modele = get_object_or_404(ModelCv, id=request.session.get("modele"))
        cv = Cv.objects.create(
            poste=titre,
            description=description,
            modele=modele,
            photo=photo,
            personne=request.user
        )

        # Garder l'id du cv en session
        request.session["cv_id"] = cv.id

        return JsonResponse({"success": True, "message": "CV enregistré avec succès"}, status=200)

    return JsonResponse({"success": False, "message": "Méthode non autorisée."}, status=405)


@login_required
def getDescription(request):
    if request.method == "GET":
        cv_id = request.session.get("cv_id")

        if not cv_id:
            return JsonResponse({"success": False, "message": "CV non trouvé."}, status=404)

        try:
            # Récupérer le CV depuis la base de données
            cvData = Cv.objects.get(id=cv_id)

            # Convertir en dictionnaire pour l'envoyer comme JSON

            cv_dict = {
                'id': cvData.id,
                'poste': cvData.poste,
                'description': cvData.description,
            }

            return JsonResponse({"success": True, "cvData": cv_dict}, status=200)

        except Cv.DoesNotExist:
            return JsonResponse({"success": False, "message": "CV introuvable."}, status=404)

    return JsonResponse({"success": False, "message": "Méthode non autorisée."}, status=405)


@login_required
def formation(request):
    # Reccuperer l'id du cv gardé en session
    if request.method == "POST":
        # Récupérer les données envoyées
        periodes = request.POST.getlist("periode[]")
        formations = request.POST.getlist("formation[]")
        etablissements = request.POST.getlist("etablissement[]")

        # # Sauvegarder les données dans la base
        for i in range(len(periodes)):
            Formation.objects.create(
                etablissement=etablissements[i],
                diplome=formations[i],
                periode=periodes[i]
            )

        return JsonResponse({"success": True, "message": "Les formations ont été enregistrées avec succès."})

    else:
        return render(request, "cv/formation.html")


@login_required
def getFormation(request):
    formations = Formation.objects.all()
    # Convertir les données en une liste de dictionnaires
    formations_data = [
        {
            "id": formation.id,
            "etablissement": formation.etablissement,
            "diplome": formation.diplome,
            "periode": formation.periode
        }
        for formation in formations
    ]
    return JsonResponse({"success": True, "formationData": formations_data})


@login_required
def getCompetence(request):
    competences = Competence.objects.all()
    # Convertir les données en une liste de dictionnaires
    competences_data = [
        {
            "id": compet.id,
            "competence": compet.competence
        }
        for compet in competences
    ]
    return JsonResponse({"success": True, "competenceData": competences_data})


@login_required
def getLoisir(request):
    loisirs = Loisir.objects.all()
    # Convertir les données en une liste de dictionnaires
    loisir_data = [
        {
            "id": loisir.id,
            "loisir": loisir.loisirs
        }
        for loisir in loisirs
    ]
    return JsonResponse({"success": True, "loisirData": loisir_data})


@login_required
def getLangue(request):
    langues = Langue.objects.all()
    # Convertir les données en une liste de dictionnaires
    langues_data = [
        {
            "id": langue.id,
            "langue": langue.langue
        }
        for langue in langues
    ]
    return JsonResponse({"success": True, "langueData": langues_data})


@login_required
def getExperience(request):
    experiences = ExperienceProfessionnelle.objects.all()
    # Convertir les données en une liste de dictionnaires
    experiences_data = [
        {
            "id": experience.id,
            "periode": experience.periode,
            "poste": experience.poste
        }
        for experience in experiences
    ]
    return JsonResponse({"success": True, "experienceData": experiences_data})


@login_required
def experienceProfessionnelle(request):

    if request.method == "POST":
        periodes = request.POST.getlist('periode[]')
        postes = request.POST.getlist('poste[]')
        entreprises = request.POST.getlist('entreprise[]')
        localites = request.POST.getlist('localite[]')
        descriptions = request.POST.getlist('description[]')

        # Sauvegarder les données dans la base
        for i in range(len(periodes)):
            ExperienceProfessionnelle.objects.create(
                job_titre=postes[i],
                periode=periodes[i],
                entreprise=entreprises[i],
                localite=localites[i],
                description=descriptions[i],
            )

        return JsonResponse({"success": True, "message": "Enregistrement reussit!"})

    else:
        return render(request, "cv/experience_pro.html")


@login_required
def competence(request):
    if request.method == "POST":
        competences = request.POST.getlist('competence[]')

        # # Sauvegarder les données dans la base
        for i in range(len(competences)):
            Competence.objects.create(
                competence=competences[i],
            )

        return JsonResponse({"success": True, "message": "Enregistrement reussit!"})

    else:
        return render(request, "cv/competence.html")


@login_required
def langue(request):
    if request.method == "POST":
        langues = request.POST.getlist('langue[]')

        # # Sauvegarder les données dans la base
        for i in range(len(langues)):
            Langue.objects.create(
                langue=langues[i],
            )

        return JsonResponse({"success": True, "message": "Enregistrement reussit!"})

    else:
        return render(request, "cv/langue.html")


@login_required
def loisirs(request):
    if request.method == "POST":
        loisirs = request.POST.getlist('loisirs[]')
        print(loisirs)
        # # Sauvegarder les données dans la base
        for i in range(len(loisirs)):
            Loisir.objects.create(
                loisirs=loisirs[i],
            )

        return JsonResponse({"success": True, "message": "Enregistrement reussit!"})

    else:
        return render(request, "cv/loisirs.html")

# gerer la connexion de l'utilisateur


def connexion(request):
    context = {}
    if request.method == "POST":
        if request.session.get('slug'):
            del request.session['slug']

        email = request.POST.get('email')
        password = request.POST.get('password')

        user = authenticate(email=email, password=password)

        if user:

            login(request, user)
            # request.session["user"] = user

            return redirect('profil')
        else:
            context['error'] = True
            return render(request, "utilisateur/connexion.html", context)
    else:
        slug = request.session.get("slug")
        if slug:
            context["slug"] = slug

        return render(request, "utilisateur/connexion.html", context)


def deconnexion(request):
    logout(request)
    return redirect("connexion")


@login_required
def profil(request):
    user_cv = Cv.objects.filter(personne=request.user)
    nbIncomplet = len(user_cv.filter(terminer=False))
    return render(request, "utilisateur/profil/index.html")


@login_required
def selectTemplate(request):
    models = ModelCv.objects.all()
    return render(request, "utilisateur/profil/templateCv/index.html", {'models': models})


@login_required
def ajouterCv(request, numero):
    request.session["modele"] = numero
    competences = Competence.objects.all()
    formations = Formation.objects.all()
    langues = Langue.objects.all()
    loisirs = Loisir.objects.all()
    experiences = ExperienceProfessionnelle.objects.all()
    context = {
        "competences": competences,
        "formations": formations,
        "langues": langues,
        "loisirs": loisirs,
        "experiences": experiences
    }
    return render(request, "utilisateur/profil/templateCv/Forms/cv.html", context)


def format(request):
    return render(request, "formatCv/1.html")


def getCv(request):
    cv_id = request.session.get("cv_id")
    cv = get_object_or_404(Cv, id=cv_id)

    loisirs = cv.loisirs.all()
    experiences = cv.experiences.all()
    langues = cv.langues.all()
    formations = cv.formations.all()
    competences = cv.competences.all()
    template_path = f"formatCv/{1}.html"
    print(f"-------------------{formations}")

    contexte = {
        'cv': cv,
        'loisirs': loisirs,
        'experiences': experiences,
        'langues': langues,
        'competences': competences,
        'formations': formations,
        'template_path': template_path
    }

    return render(request, "utilisateur/profil/detail-cv.html", contexte)


@login_required
def creerCv(request):
    # Reccuperer l'id du cv gardé en session
    if request.method == "POST":
        # Récupérer les données envoyées
        loisirs = request.POST.getlist("loisir[]")
        formations = request.POST.getlist("formation[]")
        experiences = request.POST.getlist("experience[]")
        langues = request.POST.getlist("langue[]")
        competences = request.POST.getlist("competence[]")
        titre = request.POST.get("titre")
        description = request.POST.get("description")

        modele = get_object_or_404(ModelCv, id=request.session.get("modele"))

        cv = Cv.objects.create(
            poste=titre,
            description=description,
            personne=request.user,
            modele=modele,
            terminer=False
        )

        if loisirs:
            for loisir_id in loisirs:
                loisir = get_object_or_404(Loisir, id=loisir_id)
                cv.loisirs.add(loisir)

        if formations:
            for formation_id in formations:
                formation = get_object_or_404(Formation, id=formation_id)
                cv.formations.add(formation)

        if experiences:
            for experience_id in experiences:
                experience = get_object_or_404(
                    ExperienceProfessionnelle, id=experience_id)
                cv.experiences.add(experience)

        if langues:
            for langue_id in langues:
                langue = get_object_or_404(Langue, id=langue_id)
                cv.langues.add(langue)

        if competences:
            for competence_id in competences:
                competence = get_object_or_404(Competence, id=competence_id)
                cv.competences.add(competence)

        # Sauvegarder le CV
        cv.terminer = True
        cv.save()

        request.session["cv_id"] = cv.id

        return JsonResponse({"success": True, "message": "CV créé avec succès."})

    return JsonResponse({"success": False, "message": "Requête invalide."})


@login_required
def editCompetence(request, id):
    competence = Competence.objects.get(id=id)
    if request.method == "POST":
        print(f"--------------1-OK:{competence.competence}")
        competence.competence = request.POST.get('competence')
        competence.save()
        return redirect("getCv")

    else:
        return render(request, "cv/competence.html", {"competence": competence, "edit": True})


@login_required
def editFormation(request, id):
    formation = Formation.objects.get(id=id)
    if request.method == "POST":
        print(f"--------------1-OK:")
        formation.etablissement = request.POST.get('etablissement')
        formation.diplome = request.POST.get('formation')
        formation.periode = request.POST.get('periode')
        formation.save()
        return redirect("getCv")

    else:
        return render(request, "cv/formation.html", {"formation": formation, "edit": True})


@login_required
def editLoisir(request, id):
    loisir = Loisir.objects.get(id=id)
    if request.method == "POST":
        print(f"--------------1-OK:")
        loisir.loisirs = request.POST.get('loisirs')
        loisir.save()
        return redirect("getCv")

    else:
        return render(request, "cv/loisirs.html", {"loisir": loisir, "edit": True})


@login_required
def editLangue(request, id):
    langue = Langue.objects.get(id=id)
    if request.method == "POST":
        print(f"--------------1-OK:")
        langue.langue = request.POST.get('langue')

        langue.save()
        return redirect("getCv")

    else:
        return render(request, "cv/langue.html", {"langue": langue, "edit": True})


@login_required
def editExp(request, id):
    exp = ExperienceProfessionnelle.objects.get(id=id)
    if request.method == "POST":
        print(f"--------------1-OK:")
        exp.job_titre = request.POST.get('poste')
        exp.entreprise = request.POST.get('entreprise')
        exp.localite = request.POST.get('localite')
        exp.periode = request.POST.get('periode')
        exp.description = request.POST.get('description')

        exp.save()
        return redirect("getCv")

    else:
        return render(request, "cv/experience_pro.html", {"exp": exp, "edit": True})


@login_required
def editProfil(request, id):
    cv = Cv.objects.get(id=id)
    if request.method == "POST":
        print(f"--------------1-OK:")
        cv.job_titre = request.POST.get('poste')
        cv.entreprise = request.POST.get('entreprise')

        cv.save()
        return redirect("getCv")

    else:
        return render(request, "utilisateur/profil/Forms/cv.html", {"cv": cv, "edit": True})


def email(request, cv_id):
    # Récupération du CV et de la personne associée
    cv = get_object_or_404(CV, id=cv_id, user=request.user)
    personne = cv.personne

    loisirs = cv.loisirs.all()
    experiences = cv.experiences.all()
    langues = cv.langues.all()
    formations = cv.formations.all()
    competences = cv.competences.all()

    # photo_url = request.build_absolute_uri(personne.photo.url)
    photo_url = "https://www.univ-na.ci/storage/settings/March2021/q7ebFVlLpG3BnHZWV47N.png"

    if request.method == 'POST':
        recipient_email = request.POST.get('email')

        if not recipient_email:
            messages.error(
                request, "Veuillez fournir une adresse e-mail valide.")
            return render(request, 'email.html', {'cv': cv})

        # Préparation de l'email
        subject = f"CV de {personne.nom} {personne.prenom}"
        message = render_to_string('email.html', context={
            'cv': cv,
            'loisirs': loisirs,
            'experiences': experiences,
            'langues': langues,
            'competences': competences,
            'formations': formations,
            'photo_url': photo_url,
            'is_email': True
        })

        email = EmailMessage(
            subject=subject,
            body=message,
            from_email='karimsilue487@gmail.com',
            to=[recipient_email],
        )
        email.content_subtype = 'html'  # Spécifie que le contenu est en HTML

        try:
            email.send()  # Envoi de l'email
            messages.success(request, "Le CV a été envoyé avec succès.")
        except Exception as e:
            messages.error(
                request, f"Une erreur s'est produite lors de l'envoi de l'email : {e}")

        return redirect('view_cvs')

    return render(request, 'email.html', {'cv': cv})
