from django import forms
from django.contrib.auth.models import User
from models import Users
class UserForm(forms.ModelForm):
    email = forms.EmailField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    class Meta:
		model = User
		fields = ('username', 'email', 'password')
		
class UserProfileForm(forms.ModelForm):
    age = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control'}))
    phone = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control'}))
    #picture = forms.ImageField(widget=forms.FileInput(attrs={'class': 'form-control'}))
    class Meta:
		model = Users
		fields = ('picture','age','phone')
		