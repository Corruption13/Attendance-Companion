"""from django.shortcuts import render
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

    elif request.method == 'POST':                        
        users_data = JSONParser().parse(request)
        users_serializer = CustomUserSerializer(data=room_data)
        if users_serializer.is_valid():
            item = users_serializer.save()
            return JsonResponse(room_id, status=status.HTTP_202_ACCEPTED)
        return JsonResponse(room_serializer.errors, status=status.HTTP_400_BAD_REQUEST)"""

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import UserSerializer
from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token
from rest_framework import status
from rest_framework.decorators import api_view
from django.contrib.auth import authenticate

#class UserCreate(APIView):  
#def post(self, request, format='json'):
@api_view(['POST'])  
def user_register(request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            if user:
                #token = Token.objects.create(user=user)
                json = serializer.data
                #json['token'] = token.key
                return Response(json, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def user_login(request):
    username = request.data.get("username")
    password = request.data.get("password")
    if username is None or password is None:
        return Response({'error': 'Please provide both username and password'}, status=status.HTTP_400_BAD_REQUEST)
    user = authenticate(username=username, password=password)
    if not user:
        return Response({'error': 'Invalid Credentials'}, status=status.HTTP_404_NOT_FOUND)
    token = Token.objects.create(user=user)
    #status__username=username
    #return Response({'token': token.key, 'user': token.user }, status=status.HTTP_200_OK)
    return Response({'token': token.key} , status=status.HTTP_200_OK)

                   


"""@api_view(['POST'])
@permission_classes([permissions.AllowAny,])
def register_user(request):
    if request.user.is_authenticated():
        return Response({"already_registered": "User with that username has already registered"}, status=701)
    data = request.data
    serializer = UserSerializer(data=data, partial=True)
    if serializer.is_valid():
        serializer.save(username=serializer.validated_data['email'])
        token = #call the url to get your tokens, use urllib or something similar
        return Response({"token": token}, status=status.HTTP_201_CREATED)
    else:
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)    // check against previous

"""

