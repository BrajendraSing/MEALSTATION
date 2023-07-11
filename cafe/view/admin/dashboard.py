from django.shortcuts import render, redirect
from django.views import View
from cafe.models.orders import Order
from django.db.models import IntegerField, Value
from django.db.models.functions import Cast
from django.db.models import Sum
from cafe.models.admin.admin import Admin
from cafe.models.admin.category import Category
from cafe.models.admin.items import Items
from cafe.models.customer import Customer
from cafe.models.orders import Order


#                                    

class Dashboard(View):
    def get(self, request):
        context = {}
        context['cat_count'] = Category.objects.count()
        context['item_count'] = Items.objects.count()
        context['admin_count'] = Admin.objects.count()
        context['customer_count'] = Customer.objects.count()
        context['total_revenue'] = Order.objects.filter(status="Delivered").aggregate(sum_total=Sum('total'))['sum_total']
        context['order_delivered'] = Order.objects.filter(status="Delivered").count()
        context['orders'] = Order.objects.all().order_by('-id')

        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
            
        return render(request, 'admin/dashboard.html', context)
