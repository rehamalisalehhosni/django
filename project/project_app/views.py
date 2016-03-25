from django.shortcuts import render
# Create your views here.
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from models import *
from forms import UserForm, UserProfileForm
from django.contrib.auth import authenticate, login
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required
from django.template import *

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
                #__setitem__("user_session", request)	
                request.session['user'] = user.username
                request.session['user_id'] = user.id
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
        if request.method == 'POST':
            for count,x in enumerate (request.FILES.getlist('files')):
                def handle_uploaded_file(f):
                    with open('/home/homa/Desktop/project_django/project/property_images/file_'+str(count), 'wb+') as destination:
                        for chunk in f.chunks():
                            destination.write(chunk)
                handle_uploaded_file(x)     
            return HttpResponse("please done. File(s)")
        else:            
            data = Categories.objects.filter().order_by('id')
            country_l = Country.objects.filter().order_by('id')
            city_l = City.objects.filter().order_by('id')
            return render(request,'add_property.html',{'category': data,'Country': country_l,'city': city_l})   
 
    return HttpResponse("please login required.")
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
