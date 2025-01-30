from django.forms import ModelForm
from .models import Personne
from django import forms


class PersonneForm(forms.ModelForm):
    class Meta:
        model = Personne
        fields = ['nom', 'prenom', 'email', 'telephone',  'photo',
                  'nationalite', 'situation_matrimoniale', 'mobile',]
        widgets = {
            'mot_de_passe': forms.PasswordInput(),  # Masquer le mot de passe
        }


class LoginForm(forms.Form):
    identifiant = forms.CharField(max_length=100)
    mot_de_passe = forms.CharField(widget=forms.PasswordInput)
