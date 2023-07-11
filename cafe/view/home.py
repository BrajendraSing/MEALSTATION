from django.shortcuts import redirect, render
from cafe.models import ManageCart
from django.views import View
from cafe.models.admin.carousel import get_all_items
from cafe.models.admin.category import fetch_four_category
from cafe.view.cart_count import Cart_Count

class index(View):
    def get(self, request):
        context = {}

        # displaying cart count in the header
        context['cart_count'] = Cart_Count(request)

        context['category'] = fetch_four_category()
        context['carousel'] = get_all_items()
        return render(request, 'index.html', context)
