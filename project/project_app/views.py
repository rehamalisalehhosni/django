# encoding: utf-8

from django.shortcuts import render
from django.shortcuts import get_object_or_404
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
from django.shortcuts import redirect



def index(request):
	#request=__getitem__("user_session")
	#if  request.user.is_authenticated():
    property_data = Property.objects.filter().prefetch_related('img_pro')
    return render(request,'home.html',{'property_data':property_data })
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
                #savedata.price =  request.POST['price']
                ret=savedata.save()

                c = Property.objects.latest('id')
                #check vlue not null
                for form in formset.cleaned_data:
                        image = form['image_name']
                        photo = PropertyImage(pro_id=c, image_name=image)
                        photo.save()                
                msg ="done "                        
                return render(request,'result_remove.html',{'msg':msg })
            else:
                print property_form.errors
        else:    
            property_form = AddPropertyForm()
            formset = ImageFormSet(queryset=PropertyImage.objects.none())
            #UploadfileFormSet = UploadfileFormSet()
        return render(request,'add_property.html',{'property_form': property_form,'formsetFile': formset})   
    else:
        return HttpResponse("please login required.")

    msg ="removed success "
    return render(request,'result_remove.html',{'msg':msg })
def delete_property(request,property_id):
    u = Property.objects.get(pk=property_id).delete();
    msg ="removed success \n "
    return render(request,'result_remove_image.html',{'msg':msg })

def sendMessage(request):
    if "active" in request.session and request.session['active']==1:
        if request.method == 'POST':
            u_id = Users.objects.filter(id=request.session['user_id'])[0]
            pro_id = Property.objects.filter(pk=request.POST['pro_id'])[0]
            msg =  request.POST['comment']
            msg_form = msgFormView(request.POST)
            if msg_form.is_valid() :
                savedata = msg_form.save(commit=False)
                savedata.coun_id = u_id
                savedata.pro_id = pro_id
                savedata.comment = msg
                ret=savedata.save()
                return HttpResponse('Message Saved Successffully')
        else :
            return HttpResponse('No Post Found')
    else :
        return HttpResponse('You Are Not Loged In Please Login From <a href="/login/">Here</a>')


def viewNotice(request):
    if "active" in request.session and request.session['active']==1:
        obj = Users.objects.filter(id=request.session['user_id'])[0]
        property_data = Property.objects.filter(uid=obj)
        comment_data = Comments.objects.filter()
        return render(request,'viewmyNotice.html',{'property_data':property_data , 'comment_data' : comment_data }) 
        #return HttpResponse('aaaaaaaaaf')
    else :
        return HttpResponse('You Are Not Loged In Please Login From <a href="/login/">Here</a>')



def deleteMessage(request,comment_id):
    u = Comments.objects.get(pk=comment_id).delete();
    msg ="removed success "
    return HttpResponse(msg)




def property(request,property_id):
    
        property_data = Property.objects.get(pk=property_id)
        property_data_image = PropertyImage.objects.filter(pro_id=property_data)
        msgForm = msgFormView()
        return render(request,'viewSingleProperity.html',{'property':property_data ,'images':property_data_image ,'form' : msgForm  })
        #subproperty_data = PropertyImage.objects.get(property_data)
        #return render(request,'viewSingleProperity.html',{'property':property_data , 'subproperty' : subproperty_data})    
def image_delete(request,img_id):
    c= PropertyImage.objects.get(pk=img_id)
    u = PropertyImage.objects.get(pk=img_id).delete();
    msg ="removed success "
    return render(request,'result_remove.html',{'msg':msg })

def edit_property(request,property_id):
    property_form = AddPropertyForm()
    # image_list = Property.images.all()
    pro = Property.objects.get(pk=property_id)
    image_list = PropertyImage.objects.filter(pro_id=pro)
    if request.method == 'POST':
        obj = Users.objects.filter(id=request.session['user_id'])[0]
        objcategory = Categories.objects.filter(id=request.POST['category'])[0]
        objCity = City.objects.filter(id=request.POST['city'])[0]
        objsec = Section.objects.filter(id=request.POST['section'])[0]
        instance = get_object_or_404(Property, id=property_id)
        property_form = AddPropertyForm(request.POST or None, instance=instance)
        if property_form.is_valid() :
            request.POST['category']=objcategory
            request.POST['city']=objCity
            request.POST['section']=objsec
            savedata = property_form.save(commit=False)
            savedata.uid = obj
            savedata.cat_id = objcategory
            savedata.city_id = objCity
            savedata.sec_id = objsec
            ret=savedata.save()
            msg ="done "                        
            return render(request,'result_remove.html',{'msg':msg })
        else:
            print property_form.errors
    else:
        mydata = Property.objects.get(id=property_id)
        property_form = AddPropertyForm(instance=mydata)
    return render(request,'edit_property.html',{'property_form':property_form ,'image_list':image_list,'property_id':property_id})

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
    obj = Users.objects.filter(id=request.session['user_id'])[0]
    property_data = Property.objects.filter(uid=obj)
    return render(request,'my_properties.html',{'property_data':property_data})	
def my_notifiers(request):
	return render(request,'my_notifiers.html',{'msg':"success"})	
def setting(request):
	return render(request,'setting.html',{'msg':"success"})	
def search(request):
        form= SearchForm()
        if request.method == 'POST':
            objcategory = Categories.objects.filter(id=request.POST['category'])[0]
            objcountry = Country.objects.filter(id=request.POST['country'])[0]
            objCity = City.objects.filter(id=request.POST['city'])[0]
            objsec = Section.objects.filter(id=request.POST['section'])[0]
            minimum = request.POST['MinRange']
            maximum = request.POST['MaxRange']
            #prop = property.objects.filter(cat_id =objcategory)
            #prop = Property.objects.filter()
            prop = Property.objects.filter(cat_id =objcategory ,country_id =objcountry ,city_id=objCity ,sec_id =objsec , price__gte= minimum , price__lte=maximum)
            return render(request, 'search.html',{'property':prop,'form':form})
        else :
            return render(request,'search.html',{'form':form} )

        

def newprojects(request):
    projs=NewProjects.objects.filter()
    return render(request,'newprojects.html',{'projects':projs})


def luxury(request):
    luxs=Luxury.objects.filter()
    return render(request,'luxury.html',{'luxury':luxs})

def viewSingleProject(request ,pro_id):
    project_data = NewProjects.objects.get(pk=pro_id)
    project_data_image = NewProjectsImage.objects.filter(proj_id=project_data)
    project_data_unit = Units.objects.filter(project_id=project_data)
    return render(request,'viewSingleProject.html',{'project':property_data ,'images':project_data_image ,'units' : project_data_unit})


@login_required
def user_logout(request):
    # Since we know the user is logged in, we can now just log them out.
    logout(request)
    return redirect('/index/')
