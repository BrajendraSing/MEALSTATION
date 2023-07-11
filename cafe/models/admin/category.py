from django.db import models
from django import forms

class Category(models.Model):
    name = models.CharField(max_length=40)
    image = models.ImageField(upload_to='media/images/')

    def __str__(self):
        return self.name

def fetch_four_category():
    return Category.objects.all().order_by('-id')[0:4]

def fetch_all_category():
    return Category.objects.all().order_by('-id')

def fetch_category_by_id(catId):
    return Category.objects.filter(id=catId)

def get_category_by_name(name):
    return Category.objects.filter(name=name)


class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = '__all__'