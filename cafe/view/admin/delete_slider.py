from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.carousel import Carousel


class DeleteSlider(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        return redirect('slider')

    def post(self,request, id):
        slider = Carousel.objects.get(id=id)
        try:
            slider.delete()
        except:
            pass
        return redirect('slider')
