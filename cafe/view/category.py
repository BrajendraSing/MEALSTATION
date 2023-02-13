from django.views import View
from django.shortcuts import render, redirect
from cafe.models import Category, Items, Customer, ManageCart
from cafe.view.cart_count import Cart_Count


class CategoryList(View):

    def get(self, request, catId):
        data = {}

        # displaying cart count in the header
        data['cart_count'] = Cart_Count(request)

        if request.session.get('customer_email'):
            customer_id = request.session.get('customer_id')
            data['in_cart'] = ManageCart.get_cart_items_by_customer_id(int(customer_id))

        data['category'] = Category.fetch_category_by_id(catId)
        data['items'] = Items.get_items_by_category(catId)
        data['stock'] = Items.check_stock()
        return render(request, 'category.html', data)

    def post(self, request, catId):
        p_id = request.POST.get('product_id')
        customer_id = request.session.get('customer_id')

        item = Items.get_item_by_id(p_id)
        customer = Customer.get_customer_by_id(customer_id)

        # adding item to customer cart
        # checking if the item is already available in customer cart
        if not ManageCart.check_item_already_exist(customer_id, p_id):
            # if item is not in customer cart the add
            cart = ManageCart(customer=customer, item=item, quantity=int(1))
            cart.save()

        # returning to the same produce which is currently added to the cart by customer
        url = '/category/' + catId
        return redirect(url)
