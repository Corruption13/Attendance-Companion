from rest_framework import serializers
from .models import Status
#from rooms.serializers import RoomSerializer
#from users.serializers import UserSerializer

class StatusSerializer(serializers.ModelSerializer):
    #room_id = CreateRoomSerializer(many=True, read_only=True)
    #username = UserSerializer(many=True, read_only=True)
    class Meta:
        model = Status
        fields = [              
            "username",
            "room_id",
        ]

        
        