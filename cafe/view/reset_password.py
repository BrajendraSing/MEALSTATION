from django.shortcuts import render
from django.views import View

from cafe.models import Customer


class ResetPassword(View):
    def get(self, request, token):
        return render(request, 'resetPassword.html')

    def post(self, request, token):
        data = {}
        error = None
        success = None
        password = request.POST.get('password')
        cpassword = request.POST.get('confirmpassword')

        # Validating new password
        if not password:
            error = 'password can\'t be empty'
        elif not cpassword:
            error = 'confirm passsword can\'t be empty'
        elif len(password) < 5:
            error = 'password is too short'
        elif password != cpassword:
            error = 'password and confirm password not same'
        else:
            if Customer.update_customer_password(password, token):
                if Customer.update_customer_token_by_using_token(token):
                    success = 'Password reset successfully!!'
                else:
                    error = 'Something went wrong!!'
            else:
                error = 'Something went wrong!!'

        print(token, password, cpassword)
        data['error'] = error
        data['success'] = success
        return render(request, 'resetPassword.html', data)