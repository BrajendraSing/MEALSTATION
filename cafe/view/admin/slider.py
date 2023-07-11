from django.views import View
from django.shortcuts import redirect,render
from cafe.models.admin.carousel import Carousel

class Slider(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')

        context = {}
        context['slides'] = Carousel.objects.all().order_by('-id')
        
        return render(request, "admin/slider.html",context)



