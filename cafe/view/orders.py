from django.shortcuts import redirect, render
from cafe.models import Items, Order, Customer
from django.views import View

from cafe.view.cart_count import Cart_Count


class Orders(View):

    def get(self, request):
        customer = request.session.get('customer_id')
        order = Order.get_order_by_customer(customer)
        data = {}
        data['orders'] = order

        # displaying cart count in the header
        data['cart_count'] = Cart_Count(request)

        return render(request, 'orders.html', data)

