# encoding: utf-8
from __future__ import unicode_literals
from django.contrib.auth.admin import User
from django.db import models
from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator

# Create your models here.
class Users (models.Model):
	#name=models.CharField(max_length=255)
	#email=models.EmailField()
	#password=models.IntegerField(max_length=32)
	user = models.OneToOneField(User)
	points=models.IntegerField(null=True)
	age=models.IntegerField(null=True)
	token=models.CharField(max_length=255,null=True)
	phone=models.IntegerField(unique=True)
	picture = models.ImageField(upload_to='profile_images', blank=True)
    # Override the __unicode__() method to return out something meaningful!
	def __unicode__(self):
		return unicode(self.user)


	
class Categories (models.Model):
	category_name=models.CharField(max_length=255)
	def __unicode__(self):
		return self.category_name

class Country (models.Model):
	country_name=models.CharField(max_length=255)
	def __unicode__(self):
		return self.country_name

class City (models.Model):
	city_name=models.CharField(max_length=255)
	coun_id=models.ForeignKey(Country)
	def __unicode__(self):
		return self.city_name

class Section (models.Model):
	sec_name=models.CharField(max_length=255)
	def __unicode__(self):
		return self.sec_name

class Property (models.Model):
	prop_name=models.CharField(max_length=255)
	uid=models.ForeignKey(User);
	cat_id=models.ForeignKey(Categories);
	country_id=models.ForeignKey(Country ,default=1);
	city_id=models.ForeignKey(City);
	sec_id=models.ForeignKey(Section);
	address=models.CharField(max_length=255)
	youtube=models.URLField(max_length=255)
	phone=models.IntegerField()
	owner=models.CharField(max_length=255)
	area=models.FloatField()
	price=models.FloatField()
	preview=models.TextField()
	details=models.TextField()
	longtiude=models.TextField()
	Latitude=models.TextField()
	def __unicode__(self):
		return self.uid

class PropertyImage (models.Model):
	pro_id=models.ForeignKey(Property, related_name = "img_pro")
	image_name = models.ImageField(upload_to='property_images', verbose_name='Image',)

class Comments (models.Model):
	coun_id=models.ForeignKey(User, related_name = "user_pro")
	pro_id=models.ForeignKey(Property)
	comment=models.TextField()
	#rec_id=models.ForeignKey(Users ,default=1)

#minaaaaaaaaaaaaaaaaaa#

class NewProjects(models.Model):
	pro_id=models.IntegerField()
	pro_name=models.CharField(max_length=255)
	Description=models.TextField()
	Address=models.TextField()
	Services=models.TextField()
	PaymentMethods=models.TextField()
	DeliveryDate=models.TextField()
	OwnerCompany=models.TextField()
	longtiude=models.FloatField()
	latitude=models.FloatField()
	def __unicode__(self):
		return self.pro_name

class Units(models.Model):
	unit_id=models.IntegerField()
	project_id=models.ForeignKey(NewProjects ,default="1")
	unit_name=models.CharField(max_length=255)
	min_area=models.FloatField()
	max_area=models.FloatField()
	minPrice=models.FloatField()
	maxPrice=models.FloatField()
	def __unicode__(self):
		return self.unit_name

class NewProjectsImage (models.Model):
	proj_id=models.ForeignKey(NewProjects)
	image_name = models.ImageField(upload_to='NewProjects_images', verbose_name='Image',)
	# def __unicode__(self):
	# 	return self.image_name

class Luxury(models.Model):
	lux_id=models.IntegerField()
	lux_name=models.CharField(max_length=255)
	area=models.FloatField()
	price=models.FloatField()
	Description=models.TextField()
	address=models.TextField(default="Maadi")
	longtiude=models.FloatField()
	latitude=models.FloatField()
	def __unicode__(self):
		return self.lux_name

class LuxuryImage (models.Model):
	lux_id=models.ForeignKey(Luxury)
	image_name = models.ImageField(upload_to='Luxury_images', verbose_name='Image',)

#minaaaaaaaaaaaaaaaaaaaa#