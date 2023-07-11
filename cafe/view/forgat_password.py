import uuid
from django.shortcuts import render
from django.views import View
from django.core.mail import send_mail
from cafe.models import Customer
from cafeTeria import config


class ForgetPassword(View):
    def get(self, request):
        data = {}
        return render(request, 'forgetPassword.html', data)

    def post(self, request):
        error = None
        success = None
        data = {}
        email = request.POST.get('email')

        # validating user for password reset
        if not email:
            error = 'Email cannot be empty'
            data['error'] = error
            return render(request, 'forgetPassword.html', data)

        token = uuid.uuid1()
        try:
            customer = Customer.get_customer(email)
            if customer:
                message = f'Your reset password link : http://' + config.host + '/reset-password/{}'.format(token)
                print(message)
                res = send_mail('Password Reset Request', message, config.email, [email], fail_silently=False)
                if res:
                    success = 'Email Sent!!'
                    Customer.update_customer_token(email, token)
                else:
                    error = 'Something Went wrong!!'
            else:
                error = 'User not exist!!'
        except:
            error = 'Something Went wrong!!'

        data['error'] = error
        data['success'] = success
        return render(request, 'forgetPassword.html', data)