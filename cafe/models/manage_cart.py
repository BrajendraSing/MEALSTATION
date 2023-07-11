from django.db import models
from .customer import Customer
from .admin.items import Items


class ManageCart(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    item = models.ForeignKey(Items, on_delete=models.CASCADE)
    quantity = models.IntegerField()

    @staticmethod
    def get_cart_items_by_customer_id(id):
        return ManageCart.objects.filter(customer=id).order_by('-id')

    @staticmethod
    def increase_item_quantity(id, quantity):
       return ManageCart.objects.filter(id=id).update(quantity=quantity+1)

    @staticmethod
    def decrease_item_quantity(id, quantity):
        return ManageCart.objects.filter(id=id).update(quantity=quantity - 1)

    @staticmethod
    def remove_item(id):
        return ManageCart.objects.get(id=id).delete()

    @staticmethod
    def check_item_already_exist(c_id, item_id):
        return ManageCart.objects.filter(customer=c_id, item=item_id)

    @staticmethod
    def remove_item_using_id(id):
        return ManageCart.objects.filter(id=id).delete()




