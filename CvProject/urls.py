"""
URL configuration for CvProject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""


from django.contrib import admin
from django.urls import path
from CvApp import views

from django.conf import settings
from django.conf.urls.static import static  # new

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name="index"),
    path('affiche/cv/', views.showCv, name='showCv'),
    path('nouvele-personne/', views.ajouterPersonne, name='ajouterPersonne'),
    path('description/', views.description, name='description'),
    path('formation/', views.formation, name='formation'),
    path('competence/', views.competence, name='competence'),
    path('experience-professionnelle/',
         views.experienceProfessionnelle, name='experience_pro'),
    path('langue/', views.langue, name='langue'),
    path('loisirs/', views.loisirs, name='loisirs'),
    path('connexion/', views.connexion, name='connexion'),
    path('deconnexion/', views.deconnexion, name='deconnexion'),
    path('profil-user/', views.profil, name='profil'),
    path('user/format-cv', views.selectTemplate, name='format-cv'),
    path('user/ajouter-cv/<int:numero>', views.ajouterCv, name='ajouter-cv'),
    path('g-description/', views.getDescription, name='getDescription'),
    path('get-cv/', views.getCv, name='getCv'),



    path('format/', views.format, name='format'),

    path('get-formation/', views.getFormation, name='get-formation'),
    path('get-competence/', views.getCompetence, name='get-competence'),
    path('get-langue/', views.getLangue, name='get-langue'),
    path('get-loisir/', views.getLoisir, name='get-loisir'),
    path('get-experience/', views.getExperience, name='get-experience'),
    path('enregistrer-cv/', views.creerCv, name='enregistrer_cv'),
    path('user/ajouter-cv/<int:numero>', views.ajouterCv, name='ajouter-cv'),

    path('edit-competence/<int:id>', views.editCompetence, name='edit-competence'),
    path('edit-formation/<int:id>', views.editFormation, name='edit-formation'),
    path('edit-langue/<int:id>', views.editLangue, name='edit-langue'),
    path('edit-loisir/<int:id>', views.editLoisir, name='edit-loisir'),
    path('edit-exp/<int:id>', views.editExp, name='edit-exp'),
    path('edit-profil/<int:id>', views.editProfil, name='edit-profil'),

]

if settings.DEBUG:  # new
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
