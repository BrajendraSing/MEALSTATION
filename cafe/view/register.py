from django.shortcuts import redirect, render
from django.views import View
from cafe.models import Customer
from django.contrib.auth.hashers import make_password


class Register(View):
    def get(self, request):
        data = {}
        if request.session.get('customer_email'):
            return redirect('/')
        return render(request, 'register.html', data)

    def post(self, request):
        data = {}
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        email = request.POST.get('email')
        mobile = request.POST.get('mobile')
        password = request.POST.get('password')
        cpassword = request.POST.get('cpassword')

        error = None
        success = None
        data['fname'] = fname
        data['lname'] = lname
        data['email'] = email
        data['mobile'] = mobile
        data['password'] = ""
        data['cpassword'] = ""

        if not fname:
            error = 'First Name Required!!'
        elif len(fname) < 4:
            error = 'First Name must be greater than 4 character'
        elif not lname:
            error = 'Last Name Required!!'
        elif len(lname) < 4:
            error = 'Last Name must be greater than 4 character'
        elif not email:
            error = 'Email required!!!'
        elif len(email) < 4:
            error = 'Email must be greater than 4 character'
        elif not mobile:
            error = 'Mobile No. required!!!'
        elif len(str(mobile)) != 10:
            error = 'Invalid Mobile No.'
        elif mobile:
            try:
                mobile = int(mobile)
            except Exception as e:
                data['mobile'] = ''
                error = 'Invalid Mobile No. '
                data['error'] = error
                return render(request, 'register.html', data)
        elif not password:
            error = 'Password required!!'
        elif len(password) < 4:
            error = 'Password must be greater than 4 character'
        elif password != cpassword:
            error = 'Password and Confirm Password are not same'
        password = make_password(password)
        customer = Customer(first_name=fname, last_name=lname, email=email, mobile=mobile, password=password)

        if customer.isEmailExist(email):
            error = 'Email already registered!!'

        if not error:
            customer.register()
            data['fname'] = ''
            data['lname'] = ''
            data['email'] = ''
            data['mobile'] = ''
            data['password'] = ''
            data['cpassword'] = ''
            data['success'] = 'Registered Successfully!!'
            return render(request, 'register.html', data)
        else:
            data['error'] = error
            return render(request, 'register.html', data)