from django.contrib import admin

# Register your models here.

from .models import Status

class StatusModelAdmin(admin.ModelAdmin):
	list_display = ["username", "room_id", "id_users_rooms"]           
	
	class Meta:                     
		model = Status

admin.site.register(Status, StatusModelAdmin) 