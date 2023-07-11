from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.items import Items,ItemForm


class UpdateItem(View):
    def get(self,request,id):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        instance = Items.objects.get(id=id)
        context = {
            'url':request.path_info,
            'title':'UPDATE',
            'icon':'fa fa-edit',
            'form' : ItemForm(instance=instance)
            }
        return render(request, "admin/add_item.html",context)

    def post(self,request,id):
        instance = Items.objects.get(id=id)
        context = {
            'url':request.path_info,
            'title':'UPDATE',
            'icon':'fa fa-plus-square',
            'success' : False,
            'error' : False,
            'message':'',
            'form' : ItemForm(instance=instance)
            }
       
        form = ItemForm(request.POST,request.FILES,instance=instance)
        name = request.POST.get('name')

        if name == '':
            context['error'] = True
            context['message'] = 'Name cannot be empty'
        if check_item_name_exist(name):
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

        return render(request, "admin/add_item.html",context)

        
def check_item_name_exist(name):
    if Items.objects.filter(name=name) == None:
        return True
    return False