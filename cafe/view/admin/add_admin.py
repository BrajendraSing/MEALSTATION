from django.views import View
from django.shortcuts import render,redirect
from datetime import datetime,date
from django.contrib.auth.hashers import make_password
import pytz,re
from cafe.models.admin.admin import Admin,get_admin_by_email

class AddAdmin(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {
            'url':request.path_info,
            'title':'ADD',
            'icon':'fa fa-plus-square',
            'fields':{'name':True,'email':True,'password':True,'c_password':True}
            }
        return render(request, "admin/add_admin.html",context)

    def post(self,request):
        context = {
            'url':request.path_info,
            'title':'ADD',
            'icon':'fa fa-plus-square',
            'fields':{'name':True,'email':True,'password':True,'c_password':True},
            'name':'',
            'email':'',
            'name_error' : '',
            'email_error': '',
            'password_error' : '',
            'c_password_error' : '',
            'success' : False,
            'error' : False,
            'message':'Added'
            }
        name = request.POST.get('name').strip()
        email = request.POST.get('email').strip()
        password = request.POST.get('password').strip()
        confirm = request.POST.get('confirmPassword').strip()
        context['name'] = name
        context['email'] = email

        if name == '':
            context['name_error'] = "*Name cannot be empty"
        elif len(name) < 3:
            context['name_error'] = "*Name cannot be less than 3 character"
        elif email == '':
            context['email_error'] = "*Email cannot be empty"
        elif validate_email(email) == False:
            context['email_error'] = "*Email address is invalid"
        elif check_admin_exist(email) == True:
            context['email_error'] = "*Email already registered"
        elif password == '':
            context['password_error'] = "*Password cannot be empty"
        elif len(password) < 5:
            context['password_error'] = "*Password cannot be less than 5 character"
        elif confirm == '':
            context['c_password_error'] = "*Confirm Password and Password are not same"
        elif password != confirm:
            context['c_password_error'] = "*Confirm Password and Password are not same"
        else:
            admin = Admin(
                name = name,
                email = email,
                password=make_password(password),
                token='',
                created=get_date()
            )

            try:
                admin.save()
                context['success'] = True
                context['error'] = False
                context['name'] = ''
                context['email'] = ''
            except:
                context['success'] = False
                context['error'] = True

        return render(request, "admin/add_admin.html",context)


def validate_email(email):   
    regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'
    if(re.search(regex,email)):   
        return True  
    return False 


def get_date():
    tz_IN = pytz.timezone('Asia/Kolkata')
    datetime_IN = datetime.now(tz_IN)
    return datetime_IN.date()


def check_admin_exist(email):
    if(get_admin_by_email(email)):
        return True
    return False