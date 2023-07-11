from django.views import View
from django.shortcuts import redirect,render
from cafe.models.admin.admin import Admin

class DeleteAdmin(View):
    def get(self,request, id):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        return redirect('admin')

    def post(self,request, id):
        admin = Admin.objects.get(id=id)
        try:
            admin.delete()
        except:
            pass
        return redirect('admin')
