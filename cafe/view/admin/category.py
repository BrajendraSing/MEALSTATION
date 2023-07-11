from django.views import View
from django.shortcuts import redirect,render
from cafe.models.admin.category import fetch_all_category

class Category(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {}
        context['categories'] = fetch_all_category()
        return render(request, "admin/category.html",context)



