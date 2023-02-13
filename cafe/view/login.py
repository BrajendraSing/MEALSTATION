from django.http import HttpResponse, HttpResponseRedirect
from django.views import View
from django.shortcuts import render, redirect
from cafe.models import Customer
from django.contrib.auth.hashers import check_password


class Login(View):
    return_url = None
    def get(self, request):
        Login.return_url = request.GET.get('return_url')
        data = {}
        error = ""
        success = ""
        data['error'] = error
        data['success'] = success

        if request.session.get('customer_email'):
            return redirect('/')

        return render(request, 'login.html', data)

    def post(self, request):
        data = {}
        error = ''
        success = ''
        email = request.POST.get('email')
        passwd = request.POST.get('password')
        data['email'] = email
        if not email:
            error = "Email Required!!"
        elif not passwd:
            error = 'Password Required!!'
        elif not Customer.is_email_exist(email):
            data['email'] = ''
            error = 'Invalid Email or password!!'
        else:
            customer = Customer.get_customer(email)
            flag = check_password(passwd, customer.password)
            if flag:
                data['email'] = ''
                error = ''
            else:
                data['email'] = ''
                error = 'Invalid Email or password!!'

        if not error:
            success = 'Login Successfully'
            data['error'] = error
            data['success'] = success
            request.session['customer_id'] = customer.id
            request.session['customer_email'] = customer.email
            request.session['customer_name'] = customer.first_name + " " + customer.last_name
            if Login.return_url:
                return HttpResponseRedirect(Login.return_url)
            else:
                Login.return_url = None
                return redirect('/')
        else:
            data['error'] = error
            data['success'] = success
            return render(request, 'login.html', data)


