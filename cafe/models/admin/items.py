from django.db import models
from .category import Category
from django import forms

class Items(models.Model):
    name = models.CharField(max_length=40)
    price = models.IntegerField()
    stock = models.CharField(max_length=10, choices=(('YES', 'Available'), ('NO', 'Not Available')), default='NO')
    image = models.ImageField(upload_to='media/items/')
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

def get_all_items():
    return Items.objects.all().order_by('-id')

def get_items_by_category(Id):
    return Items.objects.filter(category=Id).order_by('-id')

def get_items_by_ids(ids):
    return Items.objects.filter(id__in=ids)

def get_item_by_id(id):
    return Items.objects.get(id=id)

def check_stock():
    return Items.objects.filter(stock='YES')

def get_items_by_name_ascending():
    return Items.objects.all().order_by('name')

def get_items_by_name_decending():
    return Items.objects.all().order_by('-name')

def get_items_by_price_ascending():
    return Items.objects.all().order_by('price')

def get_items_by_price_decending():
    return Items.objects.all().order_by('-price')

def get_items_by_stock_ascending():
    return Items.objects.all().order_by('stock')

def get_items_by_stock_decending():
    return Items.objects.all().order_by('-stock')


class ItemForm(forms.ModelForm):
    class Meta:
        model = Items
        fields = '__all__'




