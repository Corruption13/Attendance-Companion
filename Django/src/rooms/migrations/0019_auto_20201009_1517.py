# Generated by Django 3.1.2 on 2020-10-09 09:47

from django.db import migrations, models
import rooms.models


class Migration(migrations.Migration):

    dependencies = [
        ('rooms', '0018_auto_20201008_1946'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='room',
            name='id',
        ),
        migrations.AlterField(
            model_name='room',
            name='room_id',
            field=models.CharField(default=rooms.models.get_code, editable=False, max_length=6, primary_key=True, serialize=False),
        ),
    ]