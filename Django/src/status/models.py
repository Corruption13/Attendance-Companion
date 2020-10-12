from django.db import models
from django.contrib.auth.models import User
from rooms.models import Room

"""def custom_id():
    return  '{} {}'.format(username, room_id)"""

class Status(models.Model):
    username = models.ForeignKey(User, on_delete=models.CASCADE)
    room_id = models.ForeignKey(Room, on_delete=models.CASCADE)
    id_users_rooms = models.AutoField(primary_key=True)
    #id_users_rooms = models.CharField(primary_key=True, default=custom_id)
    is_owner = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    is_member = models.BooleanField(default=True)
    updated = models.DateTimeField(auto_now=True, auto_now_add=False)
    timestamp = models.DateTimeField(auto_now=False, auto_now_add=True)

    class Meta:
        ordering=["-timestamp","-updated"]
        #unique_together = ("username", "room_id")

    def __str__(self):
        return '{} {}'.format(self.username, self.room_id)
       