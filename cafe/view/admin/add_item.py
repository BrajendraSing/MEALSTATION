from django.views import View
from django.shortcuts import render,redirect
from cafe.models.admin.items import Items,ItemForm

class AddItem(View):
    def get(self,request):
        if request.session.get('admin_session_email') == None:
            return redirect('admin_login')
        context = {
            'url':request.path_info,
            'title':'ADD',
            'icon':'fa fa-plus-square',
            'form' : ItemForm()
            }
        return render(request, "admin/add_item.html",context)

    def post(self,request):
        context = {
            'url':request.path_info,
            'title':'ADD',
            'icon':'fa fa-plus-square',
            'success' : False,
            'error' : False,
            'message':'Added',
            'form' : ItemForm()
            }
       
        name = request.POST.get('name')
        price = request.POST.get('price')
        form = ItemForm(request.POST,request.FILES)

        if name == '':
            context['error'] = True
            context['message'] = 'Name cannot be empty'
        elif len(name) < 3:
            context['error'] = True
            context['message'] = 'Name seem not valid'
        elif price == '':
            context['error'] = True
            context['message'] = 'Price cannot be empty'
        elif int(price) < 1:
            context['error'] = True
            context['message'] = 'Price cannot be Zero'
        elif form.is_valid():
            form.save()
            context['message'] = 'Added';
            context['error'] = False
            context['success'] = True
        else:
            context['error'] = True
            context['success'] = False

        return render(request, "admin/add_item.html",context)
