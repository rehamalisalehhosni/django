from __future__ import unicode_literals
from django.contrib.auth.admin import User
from django.db import models

# Create your models here.
class Users (User):
	#name=models.CharField(max_length=255)
	#email=models.EmailField()
	#password=models.IntegerField(max_length=32)
	signup=models.DateField()
	
class Categories (models.Model):
	category_name=models.CharField(max_length=255)

class Country (models.Model):
	country_name=models.CharField(max_length=255)
class City (models.Model):
	city_name=models.CharField(max_length=255)
	coun_id=models.ForeignKey(Country);
class Property (models.Model):
	prop_name=models.CharField(max_length=255)
	uid=models.ForeignKey(Users);
	cat_id=models.ForeignKey(Categories);
	city_id=models.ForeignKey(City);
	address=models.CharField(max_length=255)
	youtube=models.URLField(max_length=255)
	phone=models.IntegerField()
	owner=models.CharField(max_length=255)
	area=models.FloatField()
	price=models.FloatField()
	preview=models.TextField()
	details=models.TextField()
	longtiude=models.FloatField()
	Latitude=models.FloatField()

