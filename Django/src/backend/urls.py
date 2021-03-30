"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""


from django.contrib import admin
from django.urls import path
from rooms.views import room_create, add_timetable
from users.views import user_register, user_login
from status.views import room_join

urlpatterns = [
    path('admin/', admin.site.urls),
    path('register/', user_register),
    path('login/', user_login),
    path('create/', room_create),     
    path('join/', room_join), 
    path('create/timetable', add_timetable), 
      
]