from django.shortcuts import redirect, render
from cafe.models import Category, Carousel, ManageCart
from django.views import View

from cafe.view.cart_count import Cart_Count


class index(View):
    def get(self, request):
        data = {}

        # displaying cart count in the header
        data['cart_count'] = Cart_Count(request)

        data['category'] = Category.fetch_four_category()
        data['carousel'] = Carousel.get_all_items()
        return render(request, 'index.html', data)
