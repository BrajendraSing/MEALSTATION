from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.category import Category,CategoryForm


class UpdateCategory(View):
    def get(self,request,id):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        instance = Category.objects.get(id=id)
        context = {
            'url':request.path_info,
            'title':'UPDATE',
            'icon':'fa fa-edit',
            'form' : CategoryForm(instance=instance)
            }
        return render(request, "admin/add_category.html",context)

    def post(self,request,id):
        instance = Category.objects.get(id=id)
        context = {
            'url':request.path_info,
            'title':'UPDATE',
            'icon':'fa fa-plus-square',
            'success' : False,
            'error' : False,
            'message':'',
            'form' : CategoryForm(instance=instance)
            }
       
        form = CategoryForm(request.POST,request.FILES,instance=instance)
        name = request.POST.get('name')

        if name == '':
            context['error'] = True
            context['message'] = 'Name cannot be empty'
        if check_category_exist(name):
            context['error'] = True
            context['message'] = 'Name already exist'
        else:
            if form.is_valid():
                form.save()
                context['message'] = 'Updated'
                context['error'] = False
                context['success'] = True
            else:
                context['error'] = True
                context['success'] = False

        return render(request, "admin/add_category.html",context)

def check_category_exist(name):
    if Category.objects.filter(name=name) == None:
        return True
    return False