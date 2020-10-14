from django.shortcuts import render
from django.contrib import messages
from rest_framework.response import Response
from rest_framework.parsers import JSONParser 
from rest_framework import status
from rest_framework.authtoken.models import Token

# Create your views here.

from .models import Room   
from users.models import User 
from status.models import Status                   
from .serializers import CreateRoomSerializer    
from rest_framework.decorators import api_view

@api_view(['POST'])
def room_create(request):

    if request.method == 'POST':                                      
        room_serializer = CreateRoomSerializer(data=request.data)
        if room_serializer.is_valid():
            room = room_serializer.save()
            json = room_serializer.data
            username = User.objects.get(username=room.owner)
            room_id = Room.objects.get(room_id=room.room_id)
            #status = Status.objects.create(username=room.owner, room_id =room.room_id, priority=2)
            status = Status.objects.create(username=username, room_id =room_id, priority=2)
            #return Response(json, status=status.HTTP_201_CREATED)
            return Response(json)
        else:
            return Response(room_serializer.errors)
            #return Response(room_serializer.errors, status=status.HTTP_400_BAD_REQUEST)




                 
    















#status = Status.objects.create()
            #status.c = room.owner
            #status.room_id =  room.room_id
            #status.save()
            #status.username = room.cleaned_data.get('owner')
            #status.room_id =  room.cleaned_data.get('room_id')
            #status = Status( username = room.owner, room_id = room.room_id)
            #status = Status(room_id = room.room_id)
            #status.priority = 2


    """if request.method == 'POST':                                      
        #username = None
        #if request.user.is_authenticated():
                #token = Token.objects.get(user=request.user.get_username())

                    room_data = JSONParser().parse(request)
                    room_serializer = CreateRoomSerializer(data=room_data)
                    #token = Token.objects.get(user=room_serializer.owner)
                    #if token:
                    if room_serializer.is_valid():
                            item = room_serializer.save()
                 
                            #Status.username=item.owner
                            #Status.room_id = item.room_id
                            #Status.is_owner = True
                            room_id={'room_id': item.room_id}
                            return JsonResponse(room_id, status=status.HTTP_201_CREATED)
                            #return JsonResponse({ status=status.HTTP_201_CREATED)
                    else:
                            return JsonResponse(room_serializer.errors, status=status.HTTP_400_BAD_REQUEST)    works"""


    """if request.method == 'GET':
        rooms = Room.objects.all()
        rooms_serializer = RoomSerializer(rooms, many=True)
        return JsonResponse(rooms_serializer.data, safe=False)   """