from django.contrib import messages
from django.shortcuts import redirect, render, HttpResponse
from cafe.models import Items, Order, Customer, ManageCart
from django.views import View
from django.http import FileResponse


class CheckOut(View):
    def get(self, request):
        return redirect('/cart')

    def post(self, request):
        # placing the order
        phone = request.POST.get('mobile')
        student_id = request.POST.get('student_id')
        payment_method = request.POST.get('payment')
        customer = request.session.get('customer_id')
        cart = ManageCart.get_cart_items_by_customer_id(int(customer))
        if payment_method == 'online':
            return  HttpResponse("Online Payment Method")
        elif payment_method == 'qrcode':
            image = open('static/images/qrcode/paytm_qrcode.jpg', 'rb')
            for product in cart:
                if product.item.stock == 'YES':
                    qty = product.quantity
                    order = Order(item=Items(id=product.item.id),
                                customer=Customer(id=product.customer.id),
                                price=product.item.price,
                                total=product.item.price * qty,
                                payment_method=payment_method,
                                studentId=student_id,
                                mobile=phone,
                                quantity=qty
                                )
                    order.place_order()
                    ManageCart.remove_item_using_id(product.id)
            # messages.successs(request, "Order Placed Successfully!!")
            return FileResponse(image)
        else:
            for product in cart:
                if product.item.stock == 'YES':
                    qty = product.quantity
                    order = Order(item=Items(id=product.item.id),
                                customer=Customer(id=product.customer.id),
                                price=product.item.price,
                                total=product.item.price * qty,
                                payment_method=payment_method,
                                studentId=student_id,
                                mobile=phone,
                                quantity=qty
                                )
                    order.place_order()
                    ManageCart.remove_item_using_id(product.id)




        return redirect('/orders')
