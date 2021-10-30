from django.contrib import admin
from django.http import HttpResponse
from django.urls import path

from users import views


def index(request):
    return HttpResponse("Hello World!")

def trigger_error(request):
    division_by_zero = 1 / 0

urlpatterns = [
    path('admin/', admin.site.urls),
    path('sum/', views.sum, name='sum'),
    path('sentry-debug/', trigger_error),
    path('', index),
]
