from django.db import models
import secrets

# Create your models here.

class Room(models.Model):
    room_id = models.CharField(max_length=6, default=secrets.token_hex(3).upper(), editable=False)
    #room_id = models.IntegerField(primary_key=True)

    room_name = models.CharField(max_length=120)
    details = models.TextField()
    owner = models.CharField(max_length=120, null=True, blank=True)
    admins = models.CharField(max_length=120, null=True, blank=True)
    members = models.CharField(max_length=120, null=True, blank=True)
    time_table = models.TextField(null=True, blank=True)

    
    def __str__(self):
        return self.room_name


     