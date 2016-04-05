# encoding: utf-8

from django import forms
from django.contrib.auth.models import User
from models import Users
from models import *


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

class ImageForm(forms.ModelForm):
    image_name = forms.ImageField(label='Image')    
    class Meta:
        model = PropertyImage
        fields = ('image_name', )        


class AddPropertyForm(forms.ModelForm):
    category = forms.ChoiceField(choices = [],widget=forms.Select(attrs={'class':'form-control'}))
    country = forms.ChoiceField(choices = [],widget=forms.Select(attrs={'class':'form-control','id':'cat_id','onchange':'getCity()'}))
    city = forms.ChoiceField(choices = [],widget=forms.Select(attrs={'class':'form-control','id':'city_id'}))
    section = forms.ChoiceField(choices = [],widget=forms.Select(attrs={'class':'form-control','id':'sec_id'}))

    def __init__(self, *args, **kwargs):
        super(AddPropertyForm, self).__init__(*args, **kwargs)
        self.fields['category'].choices = [(x.pk, x.category_name) for x in Categories.objects.all()]
        self.fields['country'].choices = [(x.pk, x.country_name) for x in Country.objects.all()]
        self.fields['city'].choices = [(x.pk, x.city_name) for x in City.objects.all()]
        self.fields['section'].choices = [(x.pk, x.sec_name) for x in Section.objects.all()]
    prop_name = forms.CharField(label='property Name',widget=forms.TextInput(attrs={'class': 'form-control'}))
    address = forms.CharField(label='address',widget=forms.TextInput(attrs={'class': 'form-control'}))
    youtube = forms.CharField(label='youtube',widget=forms.TextInput(attrs={'class': 'form-control'}))
    owner = forms.CharField(label='owner',widget=forms.TextInput(attrs={'class': 'form-control'}))
    area = forms.CharField(label='area',widget=forms.TextInput(attrs={'class': 'form-control'}))
    price = forms.CharField(label='price',widget=forms.TextInput(attrs={'class': 'form-control'}))
    preview = forms.CharField(label='preview',widget=forms.TextInput(attrs={'class': 'form-control'}))
    details = forms.CharField(label='details',widget=forms.Textarea(attrs={'class': 'form-control'}))
    longtiude = forms.CharField(label='longtiude',widget=forms.TextInput(attrs={'class': 'form-control'}))
    Latitude = forms.CharField(label='Latitude',widget=forms.TextInput(attrs={'class': 'form-control'}))
    phone = forms.IntegerField(label='phone',widget=forms.NumberInput(attrs={'class': 'form-control'}))
    #uid=forms.CharField(required=False,label='',widget = forms.HiddenInput(attrs={'id':'user_id'}))

    #picture = forms.ImageField(widget=forms.FileInput(attrs={'class': 'form-control'}))
    #uid=models.ForeignKey(Users);
    #cat_id=models.ForeignKey(Categories);
    #city_id=models.ForeignKey(City);
    class Meta:
        model = Property
        fields = ('prop_name','category','section','address','youtube','phone','owner','area','preview','details','longtiude','Latitude','price')        
        #exclude = ('uid',)

class SearchForm(forms.ModelForm):
    category = forms.ChoiceField(choices = [],widget=forms.Select(attrs={'class':'form-control'}))
    country = forms.ChoiceField(choices = [],widget=forms.Select(attrs={'class':'form-control','id':'cat_id','onchange':'getCity()'}))
    city = forms.ChoiceField(choices = [],widget=forms.Select(attrs={'class':'form-control','id':'city_id'}))
    section = forms.ChoiceField(choices = [],widget=forms.Select(attrs={'class':'form-control','id':'sec_id'}))
    MinRange = forms.ChoiceField(choices = [(100, 100) ,(1000, 1000) ,(1500, 1500),(2000, 2000) ,(2500, 2500),(3000, 3000) ,(3500, 3500),(100000, 100000) ,(150000, 150000),(200000, 200000) ,(250000, 250000),(300000, 300000) ,(350000, 350000)],widget=forms.Select(attrs={'class':'form-control'}))
    MaxRange = forms.ChoiceField(choices = [(1000, 1000) ,(1500, 1500),(2000, 2000) ,(2500, 2500),(3000, 3000) ,(3500, 3500) ,(100000, 100000) ,(150000, 150000),(200000, 200000) ,(250000, 250000),(300000, 300000) ,(350000, 350000)],widget=forms.Select(attrs={'class':'form-control'}))
    def __init__(self, *args, **kwargs):
        super(SearchForm, self).__init__(*args, **kwargs)
        self.fields['category'].choices = [(x.pk, x.category_name) for x in Categories.objects.all()]
        self.fields['country'].choices = [(x.pk, x.country_name) for x in Country.objects.all()]
        self.fields['city'].choices = [(x.pk, x.city_name) for x in City.objects.all()]
        self.fields['section'].choices = [(x.pk, x.sec_name) for x in Section.objects.all()]

    class Meta:
        model = Property
        fields = ('category','country','city','section','MaxRange','MinRange')        
class msgFormView(forms.ModelForm):
    comment = forms.CharField(label='comment',widget=forms.Textarea(attrs={'class': 'form-control'}))
    class Meta:
        model = Comments
        fields = ('comment',)               