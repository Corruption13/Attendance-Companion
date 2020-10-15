from rest_framework.response import Response 
from rest_framework import status
from rest_framework.authtoken.models import Token
from rooms.models import Room   
from users.models import User  
from .models import Status              
from .serializers import StatusSerializer    
from rest_framework.decorators import api_view

@api_view(['POST'])
def room_join(request):
    if request.method == 'POST':                                      
        status_serializer = StatusSerializer(data=request.data)
        if status_serializer.is_valid():
            token = Token.objects.filter(user=status_serializer.validated_data["username"])  #to make sure owner is a logged in user
            if token:
                status_object = status_serializer.data     
                room = Room.objects.get(room_id=status_object["room_id"])  
                user = User.objects.get(username=status_object["username"])
                duplicate = Status.objects.filter(username=user, room_id=room)
                if duplicate:                                                 #to avoid repeated entries in status table
                    return Response({'error': 'User already part of room'}, status=status.HTTP_400_BAD_REQUEST)
                else:
                    status_object = Status.objects.create(username=user, room_id = room, priority=0)
                    return Response(status_serializer.data, status=status.HTTP_201_CREATED)
            else:
                return Response({'error': 'User not logged in'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(status_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
          