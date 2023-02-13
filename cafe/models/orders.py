from django.db import models
from .customer import Customer
from .items import Items
import datetime


class Order(models.Model):
    item = models.ForeignKey(Items, on_delete=models.CASCADE)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)
    price = models.IntegerField()
    total = models.IntegerField(default=0)
    payment_method = models.CharField(max_length=100, default=None)
    studentId = models.CharField(max_length=20, default=None)
    mobile = models.CharField(max_length=20, default='', blank=True)
    date = models.DateField(default=datetime.datetime.today)
    status = models.CharField(max_length=10, choices=(('Pending', 'Pending'), ('Ready', 'Ready'), ('Delivered', 'Delivered')), default='Pending')


    def place_order(self):
        self.save()

    def __str__(self):
        return self.item.name

    @staticmethod
    def get_order_by_customer(customer_id):
        return Order.objects.filter(customer=customer_id).order_by('-id')




