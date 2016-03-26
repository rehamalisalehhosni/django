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
        UploadfileFormSet = formset_factory(Uploadfiles, max_num=10)            
        if request.method == 'POST':
            #uid = Users.objects.only('id').get(id=request.POST['uid'])
            #request.POST['uid']=useri.id
            #Property.uid = Users.get(pk=request.session['user_id'])
            # objcategory = Categories.objects.filter(id=request.POST['category'])[0]
            # objCity = City.objects.filter(id=request.POST['city'])[0]
            # property_form.uid=obj
            # property_form.city_id=objCity
            # property_form.cat_id=objcategory
            #property_form.save()
           # UploadfileFormSet = Uploadfiles(data=request.POST)
            obj = Users.objects.filter(id=request.session['user_id'])[0]
            objcategory = Categories.objects.filter(id=request.POST['category'])[0]
            objCity = City.objects.filter(id=request.POST['city'])[0]
            request.POST['uid']=obj
            request.POST['category']=objcategory
            request.POST['city']=objCity
            #property_form = AddPropertyForm(request.POST)
            prop = Property(
                        uid=obj,
                        owner=request.POST['owner'],
                        address=request.POST['address'],
                        area=request.POST['area'],
                        price=request.POST['price'],
                        preview=request.POST['preview'],
                        details=request.POST['details'],
                        longtiude=request.POST['longtiude'],
                        Latitude=request.POST['Latitude'],
                        youtube=request.POST['youtube'],
                        prop_name=request.POST['prop_name'],
                        city_id=objCity,
                        cat_id=objcategory,
                        phone=request.POST['phone'])
            prop.save()
            #if property_form.is_valid() :
              #  property_form.save()
             #   pass
                # obj = Users.objects.filter(id=request.session['user_id'])[0]
                # objcategory = Categories.objects.filter(id=request.POST['category'])[0]
                # objCity = City.objects.filter(id=request.POST['city'])[0]
                #property_form.save(commit=False)
                #nuid = Users.objects.get(id=property_form.cleaned_data.get('uid'))
                #return HttpResponse(nuid)
                # property_form=property_form.cleaned_data
                # property_form.uid=Users.objects.get(id=request.POST['uid'])
                # property_form.save()
                # tcformset = UploadfileFormSet(request.POST, request.FILES)
                # for tc in tcformset:
                #     content_save = tc.save(commit=False)
                #     content_save = ModelWithFileField(pro_id=property_form.insert_id(),image_name = request.FILES['file'])
                #     content_save.tmodule = module_save
                #     content_save.save()
            #    return HttpResponse("done")
            #else:
            #    print property_form.errors
            return HttpResponse("Done")
        else:    
            property_form = AddPropertyForm()
            UploadfileFormSet = UploadfileFormSet()
        return render(request,'add_property.html',{'property_form': property_form,'formsetFile': UploadfileFormSet})   
    else:
        return HttpResponse("please login required.")
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
	return render(request,'search.html',{'msg':"success"})	
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
