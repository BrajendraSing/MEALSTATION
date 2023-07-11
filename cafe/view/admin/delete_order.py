from django.views import View
from django.shortcuts import render,redirect
from cafe.models.orders import Order


class DeleteOrderView(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        return redirect('order')

    def post(self,request, id):
        order = Order.objects.get(id=id)
        try:
            order.delete()
        except:
            pass
        return redirect('order')
