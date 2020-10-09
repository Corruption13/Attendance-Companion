from rest_framework import serializers
from .models import 

class CustomUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser 
        fields = [              
            "Username",
            "Password",
            "room_code",
        ]