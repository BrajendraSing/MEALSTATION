from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.service_time import ServiceTime


class DeleteSericeTime(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        return redirect('../service-time')

    def post(self,request, id):
        service = ServiceTime.objects.get(id=id)
        try:
            service.delete()
        except:
            pass
        return redirect('../service-time')
