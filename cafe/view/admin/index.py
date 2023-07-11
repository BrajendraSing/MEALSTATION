from django.shortcuts import render, redirect
from django.views import View
from django.contrib.auth.hashers import check_password
from cafe.models.admin.admin import Admin


class AdminLogin(View):
    def get(self, request):
        if request.session.get('admin_session_email'):
            return redirect('dashboard')
        context = {}
        return render(request, 'admin/admin_login.html', context)

    def post(self, request):
        context = {
            'email' : '',
            'email_error' : '',
            'password_error' : '',
            'message' : '',
            'className' : '',
            'redirect': False
        }
        email = request.POST.get('email').strip()
        password = request.POST.get('password').strip()
        context['email'] = email
        

        if email == '':
            context['email_error'] = "*Email cannot be empty"
        elif password == '':
            context['password_error'] = "*Password cannot be empty"
        else:
            admin = Admin.objects.filter(email=email)
            if admin:
                encoded = admin[0].password
                if check_password(password, encoded):
                    context['email'] = ''
                    request.session['admin_session_email'] = email
                    request.session['admin_session_name'] = admin[0].name
                    context['message'] = 'Login Successful'
                    context['className'] = 'alert alert-success'
                    context['redirect'] = True
                else:
                    context['message'] = 'Invalid Credentials'
                    context['className'] = 'alert alert-danger'
            else:
                context['message'] = 'User not exist'
                context['className'] = 'alert alert-danger'

        return render(request, 'admin/admin_login.html', context)
