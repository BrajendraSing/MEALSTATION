from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.carousel import Carousel,CarouselForm

class AddSlider(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {
            'url':request.path_info,
            'title':'ADD',
            'icon':'fa fa-plus-square',
            'form' : CarouselForm()
            }
        return render(request, "admin/add_slider.html",context)

    def post(self,request):
        context = {
            'url':request.path_info,
            'title':'ADD',
            'icon':'fa fa-plus-square',
            'success' : False,
            'error' : False,
            'message':'Added',
            'form' : CarouselForm()
            }

        form = CarouselForm(request.POST,request.FILES)

        if form.is_valid():
            form.save()
            context['error'] = False
            context['success'] = True
        else:
            context['error'] = True
            context['success'] = False

       

        return render(request, "admin/add_slider.html",context)


