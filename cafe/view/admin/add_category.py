from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.category import get_category_by_name
from cafe.models.admin.category import Category,CategoryForm

class AddCategory(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {
            'url':request.path_info,
            'title':'ADD',
            'icon':'fa fa-plus-square',
            'form' : CategoryForm()
            }
        return render(request, "admin/add_category.html",context)

    def post(self,request):
        context = {
            'url':request.path_info,
            'title':'ADD',
            'icon':'fa fa-plus-square',
            'success' : False,
            'error' : False,
            'message':'Added',
            'form' : CategoryForm()
            }
       
        form = CategoryForm(request.POST,request.FILES)

        if form.is_valid():
            form.save()
            context['error'] = False
            context['success'] = True
        else:
            context['error'] = True
            context['success'] = False

        return render(request, "admin/add_category.html",context)

def check_category_exist(name):
    if(get_category_by_name(name)):
        return True
    return False