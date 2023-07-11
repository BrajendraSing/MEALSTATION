from django.views import View
from django.shortcuts import redirect,render
from cafe.models.admin.service_time import ServiceTime,get_all_objects

class ServiceTime(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')

        context = {
            'services' : get_all_objects()
        }
        
        return render(request, "admin/service_time.html",context)



