from django.contrib import admin

# Register your models here.

from .models import Status

class StatusModelAdmin(admin.ModelAdmin):
	list_display = ["username", "room_id", "priority"]           
	
	class Meta:                     
		model = Status

admin.site.register(Status, StatusModelAdmin) 