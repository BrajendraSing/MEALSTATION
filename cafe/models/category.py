from django.db import models


class Category(models.Model):
    name = models.CharField(max_length=40)
    image = models.ImageField(upload_to='media/images/')

    def __str__(self):
        return self.name

    @staticmethod
    def fetch_four_category():
        return Category.objects.all().order_by('-id')[0:4]

    @staticmethod
    def fetch_all_category():
        return Category.objects.all().order_by('-id')

    @staticmethod
    def fetch_category_by_id(catId):
        return Category.objects.filter(id=catId)

