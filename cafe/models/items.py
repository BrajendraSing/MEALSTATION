from django.db import models
from .category import Category


class Items(models.Model):
    name = models.CharField(max_length=40)
    price = models.IntegerField()
    stock = models.CharField(max_length=10, choices=(('YES', 'Available'), ('NO', 'Not Available')), default='NO')
    image = models.ImageField(upload_to='media/items/')
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    @staticmethod
    def get_items_by_category(Id):
        return Items.objects.filter(category=Id).order_by('-id')

    @staticmethod
    def get_items_by_ids(ids):
        return Items.objects.filter(id__in=ids)

    @staticmethod
    def get_item_by_id(id):
        return Items.objects.get(id=id)

    @staticmethod
    def check_stock():
        return Items.objects.filter(stock='YES')




