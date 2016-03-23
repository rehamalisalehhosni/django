from django.shortcuts import render
# Create your views here.
   
def index(request):
	return render(request,'home.html',{'msg':"success"})	
def login(request):
	return render(request,'login.html',{'msg':"success"})	
def register(request):
	return render(request,'register.html',{'msg':"success"})	
def add_property(request):
	return render(request,'add_property.html',{'msg':"success"})	
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