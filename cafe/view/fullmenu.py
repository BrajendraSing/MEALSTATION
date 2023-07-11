from django.shortcuts import render
from django.views import View
from cafe.models.admin.category import fetch_all_category


class FullMenu(View):
    def get(self, request):
        context = {}
        context['category'] = fetch_all_category()
        return render(request, 'fullmenu.html', context)