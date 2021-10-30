from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
def sum(request):
    num1 = request.GET.get('num1', 1)
    num2 = request.GET.get('num2', 2)
    result = int(num1) + int(num2)

    return HttpResponse(f"The sum of the numbers is: {result}")