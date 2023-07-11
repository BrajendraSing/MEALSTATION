from django.views import View
from django.shortcuts import redirect,render
from cafe.models.admin.items import *

class Item(View):
    def get(self,request,token):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {'filter_url':request.path_info,}

        if token == 'all':
            context['items'] = get_all_items()

        if token == 'name':
            context['items'] = get_items_by_name_ascending()

        if token == 'names':
            context['items'] = get_items_by_name_decending()

        if token == 'price':
            context['items'] = get_items_by_price_ascending()

        if token == 'prices':
            context['items'] = get_items_by_price_decending()

        if token == 'stock':
            context['items'] = get_items_by_stock_ascending()

        if token == 'stocks':
            context['items'] = get_items_by_stock_decending()
        
        return render(request, "admin/item.html",context)



