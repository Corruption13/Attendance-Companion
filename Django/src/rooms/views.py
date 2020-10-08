from django.shortcuts import render
from django.contrib import messages
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser 
from rest_framework import status



# Create your views here.

from .models import Room                       
from .serializers import RoomSerializer    
from rest_framework.decorators import api_view

@api_view(['POST', 'GET'])
def room_create(request):

    if request.method == 'GET':
        rooms = Room.objects.all()
        rooms_serializer = RoomSerializer(rooms, many=True)
        return JsonResponse(rooms_serializer.data, safe=False)

    elif request.method == 'POST':
        room_data = JSONParser().parse(request)
        room_serializer = RoomSerializer(data=room_data)
        if room_serializer.is_valid():
            item = room_serializer.save()
            room_id={'room_id': item.room_id}
            return JsonResponse(room_id, status=status.HTTP_201_CREATED)
        return JsonResponse(room_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
     
    
   