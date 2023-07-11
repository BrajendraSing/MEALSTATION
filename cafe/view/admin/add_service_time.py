from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.service_time import ServiceTime,ServiceTimeForm

class AddServiceTime(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {
            'url':request.path_info,
            'title':'ADD',
            'icon':'fa fa-plus-square',
            'form' : ServiceTimeForm()
            }
        return render(request, "admin/add_service_time.html",context)

    def post(self,request):
        context = {
            'url':request.path_info,
            'title':'ADD',
            'icon':'fa fa-plus-square',
            'success' : False,
            'error' : False,
            'message':'Added',
            'form' : ServiceTimeForm()
            }
       
        form = ServiceTimeForm(request.POST,request.FILES)

        if form.is_valid():
            form.save()
            context['error'] = False
            context['success'] = True
        else:
            context['error'] = True
            context['success'] = False

        return render(request, "admin/add_service_time.html",context)
