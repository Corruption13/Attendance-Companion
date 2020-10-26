from rest_framework import serializers
from .models import Room
from django.db import models

class CreateRoomSerializer(serializers.ModelSerializer):
   class Meta:
        model = Room 
        fields = [              
            "room_name",
            "details",
            "timetable",
        ]

    
        
      
