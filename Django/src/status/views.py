from django.shortcuts import render
from django.contrib import messages
from rest_framework.response import Response 
from rest_framework import status
from rest_framework.authtoken.models import Token

# Create your views here.

from rooms.models import Room   
from users.models import User  
from .models import Status              
from .serializers import StatusSerializer    
from rest_framework.decorators import api_view


@api_view(['POST'])
def room_join(request):

    if request.method == 'POST':                                      
        status_serializer = StatusSerializer(data=request.data)
        #return Response(status_serializer.initial_data)

        if status_serializer.is_valid():
            status = status_serializer.data      #serializer.data is a dictionary
            #status = status_serializer.save()
            #return Response(temp)
            #json = status_serializer.data
            
            room = Room.objects.get(room_id=status["room_id"])   #hence access like this
            user = User.objects.get(username=status["username"])

            duplicate = Status.objects.filter(username=user, room_id=room)
            if duplicate:                                                 #to avoid repeated entries in status table
                return Response({'error': 'User already part of room'})
            else:    

                status = Status.objects.create(username=user, room_id = room, priority=0)
                #status.save()

                return Response(status_serializer.data)
        else:
            #return Response(status_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            return Response(status_serializer.errors)