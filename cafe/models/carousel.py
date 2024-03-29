from django.db import models


class Carousel(models.Model):
    message = models.CharField(max_length=200, default='Banner Size must be 700X350 ')
    image = models.ImageField(upload_to='media/images/carousel/')

    @staticmethod
    def get_all_items():
        return Carousel.objects.all().order_by('-id')
