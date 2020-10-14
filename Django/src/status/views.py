from django.shortcuts import render
from django.contrib import messages
from rest_framework.response import Response 
from rest_framework import status
from rest_framework.authtoken.models import Token

# Create your views here.

from rooms.models import Room   
from django.contrib.auth.models import User                
from .serializers import StatusSerializer    
from rest_framework.decorators import api_view


@api_view(['POST'])
def room_join(request):

    if request.method == 'POST':                                      
        status_serializer = StatusSerializer(data=request.data)
        #return Response(status_serializer.initial_data)

        if status_serializer.is_valid():
            status = status_serializer.save(commit=False)
            #status = status_serializer.save()
            #return Response(status_serializer.data)
            #json = status_serializer.data
            username = User.objects.get(username=status.username)
            room_id = Room.objects.get(room_id=status.room_id)
            status = Status.objects.update(username=username, room_id = room_id, priority=0)
            status.save()

            return Response(status_serializer.data)
        else:
            #return Response(status_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            return Response(status_serializer.errors)