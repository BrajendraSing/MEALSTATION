from django.contrib.auth.hashers import make_password
from django.db import models


class Customer(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField()
    mobile = models.CharField(max_length=15)
    password = models.CharField(max_length=500)
    token = models.CharField(max_length=500, default=0)

    def register(self):
        self.save()

    def __str__(self):
        return self.first_name + ' ' + self.last_name

    def isEmailExist(self, email):
        flag = Customer.objects.filter(email=email)
        if flag:
            return True
        else:
            return False

    @staticmethod
    def is_email_exist(email):
        flag = Customer.objects.filter(email=email)
        if flag:
            return True
        else:
            return False

    @staticmethod
    def get_customer(email):
        return Customer.objects.get(email=email)

    @staticmethod
    def get_customer_by_id(id):
        return Customer.objects.get(id=id)

    @staticmethod
    def update_customer_token(email, token):
        return Customer.objects.filter(email=email).update(token=token)

    @staticmethod
    def update_customer_password(password, token):
        return Customer.objects.filter(token=token).update(password=make_password(password))

    @staticmethod
    def update_customer_token_by_using_token(token):
        return Customer.objects.filter(token=token).update(token='')
