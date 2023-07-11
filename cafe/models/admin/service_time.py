from django.db import models
from django import forms

class ServiceTime(models.Model):
    edit = models.CharField(default='Click Here',max_length=50)
    message = models.CharField(max_length=100, default='Time must be in 24 hour format')
    open = models.TimeField()
    close = models.TimeField()

    @staticmethod
    def openTime():
        return ServiceTime.objects.all().order_by('-id')[0:1]

def get_all_objects():
    return ServiceTime.objects.all().order_by('-id')


class ServiceTimeForm(forms.ModelForm):
    class Meta:
        model = ServiceTime
        fields = ('open','close')





