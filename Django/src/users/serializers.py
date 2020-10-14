from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from .models import User
from django.db import models
#from rooms.views import Room

class UserSerializer(serializers.ModelSerializer):
    
    #username = serializers.CharField(max_length=32, validators=[UniqueValidator(queryset=User.objects.all())])
    #password = serializers.CharField(min_length=8, write_only=True)
    #password = serializers.CharField(min_length=8)
    #id_users_rooms = StatusSerializer(many=True, read_only=True)
    #rooms = models.ManyToManyField(Room, related_name='rOOm', through="Status")

    def create(self, validated_data):
        user = User.objects.create_user(validated_data['username'], validated_data['password'])
        return user

    class Meta:
        model = User 
        fields = [              
            "username",
            "password",
        ]
        ordering = ["-timestamp","-updated"]
        


    	