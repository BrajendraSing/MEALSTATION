from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.items import Items


class DeleteItem(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        return redirect('../item/all')

    def post(self,request, id):
        item = Items.objects.get(id=id)
        try:
            item.delete()
        except:
            pass
        return redirect('../item/all')
