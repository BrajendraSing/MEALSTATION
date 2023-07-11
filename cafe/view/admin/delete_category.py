from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.category import Category


class DeleteCategory(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        return redirect('category')

    def post(self,request, id):
        category = Category.objects.get(id=id)
        try:
            category.delete()
        except:
            pass
        return redirect('category')
