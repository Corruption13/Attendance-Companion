from django.contrib import admin
from .models import Status

# Register your models here.

class StatusModelAdmin(admin.ModelAdmin):
	list_display = ["username", "room_id", "priority"]           
	
	class Meta:                     
		model = Status

admin.site.register(Status, StatusModelAdmin) 