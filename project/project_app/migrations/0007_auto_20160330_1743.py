# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-03-30 17:43
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('project_app', '0006_luxury_address'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='newprojects',
            name='unit_id',
        ),
        migrations.AddField(
            model_name='units',
            name='project_id',
            field=models.ForeignKey(default='1', on_delete=django.db.models.deletion.CASCADE, to='project_app.NewProjects'),
        ),
    ]
