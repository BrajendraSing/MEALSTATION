from django.views import View
from django.shortcuts import render,redirect
from cafe.models.orders import Order,OrderForm


class UpdateOrderView(View):
    def get(self,request,id):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        instance = Order.objects.get(id=id)
        context = {
            'url':request.path_info,
            'title':'UPDATE',
            'icon':'fa fa-edit',
            'form' : OrderForm(instance=instance)
            }
        return render(request, "admin/update_order.html",context)

    def post(self,request,id):
        instance = Order.objects.get(id=id)
        context = {
            'url':request.path_info,
            'title':'UPDATE',
            'icon':'fa fa-plus-square',
            'success' : False,
            'error' : False,
            'message':'',
            'form' : OrderForm(instance=instance)
            }
       
        form = OrderForm(request.POST,request.FILES,instance=instance)

        if form.is_valid():
            form.save()
            context['message'] = 'Updated'
            context['error'] = False
            context['success'] = True
        else:
            context['error'] = True
            context['success'] = False

        return render(request, "admin/update_order.html",context)
