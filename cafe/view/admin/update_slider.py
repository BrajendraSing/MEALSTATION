from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.carousel import Carousel,CarouselForm


class UpdateSlider(View):
    def get(self,request,id):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {
            'url':request.path_info,
            'title':'UPDATE',
            'icon':'fa fa-edit',
            }
        return render(request, "admin/add_slider.html",context)