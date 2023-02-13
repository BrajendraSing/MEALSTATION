from django.db import models


class ServiceTime(models.Model):
    edit = models.CharField(default='Click Here',max_length=50)
    message = models.CharField(max_length=100, default='Time must be in 24 hour format')
    open = models.TimeField()
    close = models.TimeField()

    @staticmethod
    def openTime():
        return ServiceTime.objects.all().order_by('-id')[0:1]







