from django.views import View
from django.shortcuts import redirect,render
from cafe.models.orders import Order

class OrderView(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {'filter_url':request.path_info}
        
        context['orders'] = Order.objects.all().order_by('-id')
        
        return render(request, "admin/order.html",context)



