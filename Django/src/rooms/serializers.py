from rest_framework import serializers
from .models import Room
from django.db import models

class RoomSerializer(serializers.ModelSerializer):
    #room_name = serializers.CharField(max_length=120)
    #details = serializers.TextField()
    class Meta:
        model = Room 
        fields = [              
            "room_name",
            "details",
        ]

        
      
