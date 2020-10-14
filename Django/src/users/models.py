from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _

#Create your models here.

from rooms.models import Room 

class User(AbstractUser):
    #is_owner = models.BooleanField(default=False, help_text='Designates whether this user has all permissions without explicitly assigning them.', verbose_name='owner status')
    #is_admin = models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='admin status')
    #is_member = models.BooleanField(default=True, help_text='Designates whether this user can access a classroom.', verbose_name='member')
    #room_code = models.ForeignKey(Room, on_delete=models.CASCADE, to_field='room_id')
    #room_code = models.ManyToManyField(Room) 
    username = models.CharField(max_length=32, primary_key=True)
    password = models.CharField(max_length=32)
    #password = models.CharField(min_length=8)
  


 
    
    