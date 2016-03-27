from django.shortcuts import render
# Create your views here.
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from models import *
from forms import *
from django.contrib.auth import authenticate, login
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required
from django.template import *
import json
from django.core.serializers.json import DjangoJSONEncoder
from django.core import serializers
from django.forms.formsets import formset_factory
from django import forms
from django.forms import modelformset_factory
def index(request):
	#request=__getitem__("user_session")
	#if  request.user.is_authenticated():
	if "active" in request.session and request.session['active']==1:
		return render(request,'home.html',{'msg':"success"})	
	else:
		return render(request,'home.html',{'msg':"success"})	

def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            if user.is_active:
                login(request, user)
                users = Users.objects.all().filter(user=user.id).order_by('id') 
                for x in users :
                    id_u=x.id
                #__setitem__("user_session", request)	
                request.session['user'] = user.username
                request.session['user_id'] = id_u
                request.session['active'] = 1
                return HttpResponseRedirect('/index/')
            else:
                return HttpResponse("Your  account is disabled.")
        else:
            print "Invalid login details: {0}, {1}".format(username, password)
            return HttpResponse("Invalid login details supplied.")
    else:
        return render(request, 'login.html')
#	return render(request,'login.html',{'msg':"success"})	
def register(request):
    registered = False
    if request.method == 'POST':
        user_form = UserForm(data=request.POST)
        profile_form = UserProfileForm(data=request.POST)
        if user_form.is_valid() and profile_form.is_valid():
            user = user_form.save()
            user.set_password(user.password)
            user.save()
            profile = profile_form.save(commit=False)
            profile.user = user
            if 'picture' in request.FILES:
                profile.picture = request.FILES['picture']
            profile.save()
            registered = True
        else:
            print user_form.errors, profile_form.errors
    else:
        user_form = UserForm()
        profile_form = UserProfileForm()
    return render(request,'register.html',{'user_form': user_form, 'profile_form': profile_form, 'registered': registered} )
#	return render(request,'register.html',{'msg':"success"})	
def add_property(request):
    if "active" in request.session and request.session['active']==1:
        ImageFormSet = modelformset_factory(PropertyImage,form=ImageForm, extra=3)
        if request.method == 'POST':
            obj = Users.objects.filter(id=request.session['user_id'])[0]
            objcategory = Categories.objects.filter(id=request.POST['category'])[0]
            objCity = City.objects.filter(id=request.POST['city'])[0]
            objsec = Section.objects.filter(id=request.POST['section'])[0]
            property_form = AddPropertyForm(request.POST)
            #images
            formset = ImageFormSet(request.POST, request.FILES,queryset=PropertyImage.objects.none())

            if property_form.is_valid() :
                request.POST['category']=objcategory
                request.POST['city']=objCity
                request.POST['section']=objsec
                savedata = property_form.save(commit=False)
                savedata.uid = obj
                savedata.cat_id = objcategory
                savedata.city_id = objCity
                savedata.sec_id = objsec
                savedata.price =  request.POST['price']
                ret=savedata.save()

                c = Property.objects.latest('id')
                for form in formset.cleaned_data:
                    image = form['image_name']
                    photo = PropertyImage(pro_id=c, image_name=image)
                    photo.save()

                return HttpResponse("done")
            else:
                print property_form.errors
        else:    
            property_form = AddPropertyForm()
            formset = ImageFormSet(queryset=PropertyImage.objects.none())
            #UploadfileFormSet = UploadfileFormSet()
        return render(request,'add_property.html',{'property_form': property_form,'formsetFile': formset})   
    else:
        return HttpResponse("please login required.")


def property(request,property_id):
    
        property_data = Property.objects.get(pk=property_id)
        return render(request,'viewSingleProperity.html',{'property':property_data })
        #subproperty_data = PropertyImage.objects.get(property_data)
        #return render(request,'viewSingleProperity.html',{'property':property_data , 'subproperty' : subproperty_data})    
 

def getcity(request):
    city_l = City.objects.filter(coun_id=request.GET['id']).order_by('id') 
    data=''
    for x in city_l:
        data +="<option value='"+str(x.id)+"'>"+x.city_name+"</option>"
    #data = serializers.serialize('json', city_l, fields=('city_name','id'))
    return HttpResponse(data)   
def mypoints(request):
	return render(request,'mypoints.html',{'msg':"success"})	
def my_properties(request):
	return render(request,'my_properties.html',{'msg':"success"})	
def my_notifiers(request):
	return render(request,'my_notifiers.html',{'msg':"success"})	
def setting(request):
	return render(request,'setting.html',{'msg':"success"})	
def search(request):

        # if "active" in request.session and request.session['active']==1:
        #     objCountry = Country.objects.filter(id=request.POST['country'])[0]
        #     objcategory = Categories.objects.filter(id=request.POST['category'])[0]
        #     objCity = City.objects.filter(id=request.POST['city'])[0]
        # else:
            form= SearchForm()
            return render(request,'search.html' ,{'form':form})


def luxury(request):
	return render(request,'luxury.html',{'msg':"success"})		
@login_required
def user_logout(request):
    # Since we know the user is logged in, we can now just log them out.
	del request.session['user']
	del request.session['active']
	logout(request)

    # Take the user back to the homepage.
 	return HttpResponseRedirect('/index/')
#admin.site.unregister(User)
#admin.site.register(User)
