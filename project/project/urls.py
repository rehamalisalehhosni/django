"""project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
import settings
from django.conf.urls import url
from django.contrib import admin
from project_app import views
from django.conf.urls import include

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^index/', views.index),
    url(r'^login/', views.user_login),
    url(r'^register/',views.register),
    url(r'^add_property/', views.add_property),
    url(r'^mypoints/', views.mypoints),
    url(r'^my_properties/', views.my_properties),
    url(r'^properties/(\d{1,4})/$', views.property),
    url(r'^delete_property/(\d{1,4})/$', views.delete_property),
    url(r'^edit_property/(\d{1,4})/$', views.edit_property),
    url(r'^my_notifiers/', views.my_notifiers),
    url(r'^setting/', views.setting),
    url(r'^search/', views.search),
    url(r'^luxury/', views.luxury),
    url(r'^newprojects/', views.newprojects),
    url(r'^viewSingleProject/(\d{1,4})/$', views.viewSingleProject),
    url(r'^logout/', views.user_logout),
    url(r'^getcity/', views.getcity),
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve',{'document_root': settings.MEDIA_ROOT}),
    url(r'^send_message/', views.sendMessage),
    url(r'^my_notice/', views.viewNotice),
    url(r'^delete_msg/(\d{1,4})/$', views.deleteMessage),
    url(r'^accounts/', include('allauth.urls')),


]



