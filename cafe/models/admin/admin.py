from django.db import models
from django.contrib.auth.hashers import make_password


class Admin(models.Model):
    name = models.CharField(max_length=40)
    email = models.EmailField()
    password = models.CharField(max_length=255)
    token = models.CharField(max_length=255)
    created = models.DateField()


    def __str__(self):
        return self.name

    @staticmethod
    def get_admin(email):
        return Admin.objects.get(email=email)
    
    @staticmethod
    def update_admin_token(email, token):
        return Admin.objects.filter(email=email).update(token=token)

    @staticmethod
    def update_admin_password(password, token):
        return Admin.objects.filter(token=token).update(password=make_password(password))

    @staticmethod
    def update_admin_token_by_using_token(token):
        return Admin.objects.filter(token=token).update(token='')


@staticmethod
def get_admin_by_email(email):
    return Admin.objects.filter(email=email)

def get_admins():
    return Admin.objects.all()
    
def get_admin_by_id(id):
    return Admin.objects.filter(id=id)
    