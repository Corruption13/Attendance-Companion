from django.contrib import admin
from .models import Room

# Register your models here.

class RoomModelAdmin(admin.ModelAdmin):
	list_display = ["room_id", "room_name", "owner"]           
	
	class Meta:                     
		model = Room

admin.site.register(Room, RoomModelAdmin) 