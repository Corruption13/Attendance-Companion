from django.shortcuts import render
from django.contrib import messages
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser 
from rest_framework import status

# Create your views here.

from .models import CustomUser                     
from .serializers import CustomUserSerializer   
from rest_framework.decorators import api_view

@api_view(['POST', 'GET'])
def room_join(request):
    if request.method == 'GET':
        users = CustomUser.objects.all()
        users_serializer = CustomUserSerializer(users, many=True)
        return JsonResponse(users_serializer.data, safe=False)

    elif request.method == 'POST':                        #takes in username, password and room code, accepted if room exists
        users_data = JSONParser().parse(request)
        users_serializer = CustomUserSerializer(data=room_data)
        if users_serializer.is_valid():
            item = users_serializer.save()
            return JsonResponse(room_id, status=status.HTTP_202_ACCEPTED)
        return JsonResponse(room_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
     