from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.admin import get_admins

class Admin(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {'admins':get_admins()}
        return render(request, "admin/admin.html",context)
