from django.shortcuts import render
from django.views import View
from cafe.models import Category


class FullMenu(View):
    def get(self, request):
        data = {}
        data['category'] = Category.fetch_all_category()
        return render(request, 'fullmenu.html', data)