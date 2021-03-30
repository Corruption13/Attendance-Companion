from rest_framework.response import Response
from rest_framework import status
from rest_framework.authtoken.models import Token
from .models import Room   
from users.models import User 
from status.models import Status                   
from .serializers import CreateRoomSerializer  
from .serializers import AddTimetableSerializer    
from rest_framework.decorators import api_view
import json


"""
    API Response Table:

    400: Invalid POST
    201: Room Created
    401: User not logged in
    403: User not owner or admin

"""

@api_view(['POST'])
def room_create(request):
    if request.method == 'POST':                                      
        room_serializer = CreateRoomSerializer(data=request.data)
        #room_serializer.initial_data["timetable"] = json.dumps(room_serializer.initial_data["timetable"], indent=4)
        if room_serializer.is_valid():
            #token = Token.objects.filter(user=room_serializer.validated_data["owner"])  #to make sure owner is a logged in user
            #Key = request.META['HTTP_AUTHORIZATION']
            #print(Key)
            #token = Token.objects.filter(key=Key) 

            #if token:
            if True:

                user = Token.objects.get(key=request.META['HTTP_AUTHORIZATION']).user  # Retrieve the user linked to the token provided. 
                room = room_serializer.save(owner=user)
             

                status_object = Status.objects.create(username=User.objects.get(username=room.owner),
                                                      room_id =Room.objects.get(room_id=room.room_id), 
                                                      priority=2)
                return Response({'room_id': room.room_id}, status=status.HTTP_201_CREATED)
            else:
                return Response({'error': 'User not logged in'}, status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(room_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST','GET'])
def add_timetable(request):
    if request.method == 'POST':                                      
        room_serializer = AddTimetableSerializer(data=request.data)
        room_serializer.initial_data["timetable"] = json.dumps(room_serializer.initial_data["timetable"], indent=4)
        if room_serializer.is_valid():
            #token = Token.objects.filter(user=room_serializer.validated_data["owner"])  #to make sure owner is a logged in user
            token = Token.objects.filter(key=request.META['HTTP_AUTHORIZATION']) 

            if token:

                user = Token.objects.get(key=request.META['HTTP_AUTHORIZATION']).user  # Retrieve the user linked to the token provided. 
                priority = Status.objects.filter(username=user, room_id=room)
                if priority >=1:
                    room = room_serializer.save()
                    return Response(status=status.HTTP_201_CREATED)
                else:
                    return Response({'error': 'User doesnt have permission'}, status=status.HTTP_403_FORBIDDEN)
                
            else:
                return Response({'error': 'User not logged in'}, status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(room_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    if request.method == 'GET': 
        room_serializer = AddTimetableSerializer(data=request.data)
        room_serializer.initial_data["timetable"] = json.loads(room_serializer.initial_data["timetable"])














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