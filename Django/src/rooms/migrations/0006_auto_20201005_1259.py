# Generated by Django 3.1.2 on 2020-10-05 07:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rooms', '0005_auto_20201005_1253'),
    ]

    operations = [
        migrations.AlterField(
            model_name='room',
            name='room_id',
            field=models.UUIDField(editable=False, primary_key=True, serialize=False),
        ),
    ]
