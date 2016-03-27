# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-03-27 17:09
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Categories',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_name', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('city_name', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Comments',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('country_name', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Property',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('prop_name', models.CharField(max_length=255)),
                ('address', models.CharField(max_length=255)),
                ('youtube', models.URLField(max_length=255)),
                ('phone', models.IntegerField()),
                ('owner', models.CharField(max_length=255)),
                ('area', models.FloatField()),
                ('price', models.FloatField()),
                ('preview', models.TextField()),
                ('details', models.TextField()),
                ('longtiude', models.FloatField()),
                ('Latitude', models.FloatField()),
                ('cat_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project_app.Categories')),
                ('city_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project_app.City')),
            ],
        ),
        migrations.CreateModel(
            name='PropertyImage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image_name', models.ImageField(upload_to='property_images', verbose_name='Image')),
                ('pro_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project_app.Property')),
            ],
        ),
        migrations.CreateModel(
            name='Section',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sec_name', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('points', models.IntegerField(null=True)),
                ('age', models.IntegerField(null=True)),
                ('token', models.CharField(max_length=255, null=True)),
                ('phone', models.IntegerField(unique=True)),
                ('picture', models.ImageField(blank=True, upload_to='profile_images')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='property',
            name='sec_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project_app.Section'),
        ),
        migrations.AddField(
            model_name='property',
            name='uid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project_app.Users'),
        ),
        migrations.AddField(
            model_name='comments',
            name='coun_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project_app.Users'),
        ),
        migrations.AddField(
            model_name='comments',
            name='pro_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project_app.Property'),
        ),
        migrations.AddField(
            model_name='city',
            name='coun_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project_app.Country'),
        ),
    ]
