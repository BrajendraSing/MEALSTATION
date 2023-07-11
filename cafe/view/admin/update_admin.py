from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.admin import Admin,get_admin_by_id,get_admin_by_email
import re

class UpdateAdmin(View):
    def get(self,request,id):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {
            'url':request.path_info,
            'title':'UPDATE',
            'icon':'fa fa-edit',
            'admin':get_admin_by_id(id),
            'fields':{'name':True,'email':True,'password':False,'c_password':False},
            }
        return render(request, "admin/add_admin.html",context)

    def post(self,request,id):
        context = {
                'url':request.path_info,
                'title':'UPDATE',
                'icon':'fa fa-edit',
                'fields':{'name':True,'email':True,'password':False,'c_password':False},
                'name':'',
                'email':'',
                'name_error' : '',
                'email_error': '',
                # 'password_error' : '',
                # 'c_password_error' : '',
                'success' : False,
                'error' : False,
                'message' : 'Updated'
                }
        name = request.POST.get('name').strip()
        email = request.POST.get('email').strip()
        # password = request.POST.get('password').strip()
        # confirm = request.POST.get('confirmPassword').strip()
        context['name'] = name
        context['email'] = email

        if name == '':
            context['name_error'] = "*Name cannot be empty";
        elif len(name) < 3:
            context['name_error'] = "*Name cannot be less than 3 character";
        elif email == '':
            context['email_error'] = "*Email cannot be empty";
        elif validate_email(email) == False:
            context['email_error'] = "*Email address is invalid";
        elif check_admin_exist(email) == True:
            context['email_error'] = "*Email already registered";
        else:
            admin = Admin.objects.get(id=id)
            admin.name = name
            admin.email = email

            try:
                admin.save()
                context['success'] = True
                context['error'] = False
                context['name'] = ''
                context['email'] = ''
            except Exception as e:
                print(e)
                context['success'] = False
                context['error'] = True
            
        return render(request, "admin/add_admin.html",context)

def validate_email(email):   
    regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'
    if(re.search(regex,email)):   
        return True  
    else:   
        return False 

def check_admin_exist(email):
    if(get_admin_by_email(email)):
        return True
    return False