from django.db import models
from users.models import User
from rooms.models import Room

class Status(models.Model):
    username = models.ForeignKey(User, on_delete=models.CASCADE)
    room_id = models.ForeignKey(Room, on_delete=models.CASCADE)
    id_users_rooms = models.AutoField(primary_key=True)
    priority = models.IntegerField()
    updated = models.DateTimeField(auto_now=True, auto_now_add=False)
    timestamp = models.DateTimeField(auto_now=False, auto_now_add=True)

    class Meta:
        ordering=["-timestamp","-updated"]

    def __str__(self):
        return '{} {}'.format(self.username, self.room_id)
       