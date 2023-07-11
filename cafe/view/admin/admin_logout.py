from django.shortcuts import redirect
from django.views import View

class AdminLogout(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
            
        if request.session.get('admin_session_email'):
            request.session['admin_session_email'] = None

        if request.session.get('admin_session_name'):
            request.session['admin_session_name'] = None

        request.session.clear()
        return redirect('admin_login')