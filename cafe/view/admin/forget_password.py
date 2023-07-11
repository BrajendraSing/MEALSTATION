from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.admin import Admin
from cafeTeria import config
from django.core.mail import send_mail
import uuid

class AdminForgetPassword(View):
    def get(self,request):
        context = {}
        return render(request, "admin/forget_password.html",context)

    def post(self,request):
        context = {
            'success' : '',
            'error' : ''
            }
        email = request.POST.get('email').strip()
        
        # if check_admin_exist(email):
            # context['success'] = "Reset email is sended to your email"
        token = uuid.uuid1()
        try:
            admin = Admin.get_admin(email)
            if admin:
                message = f'Your reset password link for mealstation: http://' + config.host + '/admin/reset-password/{}'.format(token)
                print("Message must be printed : ",message)
                res = send_mail('Password Reset Request', message, config.email, [email], fail_silently=False)
                if res:
                    context['success'] = 'Email Sent!!'
                    Admin.update_admin_token(email, token)
                else:
                    context['error'] = '1 Something Went wrong!!'
            else:
                context['error'] = "User not exist with this email"
        except Exception as e:
            print(e)
            context['error'] = '2 Something Went Wrong!!'
        

        return render(request, "admin/forget_password.html",context)



def check_admin_exist(email):
    return Admin.objects.filter(email=email)