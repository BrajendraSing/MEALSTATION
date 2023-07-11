from django.contrib import admin, messages
from django.shortcuts import render
from django.utils.html import format_html
from .models.admin.category import Category
from .models.admin.items import Items
from .models.customer import Customer
from .models.admin.carousel import Carousel
from .models.orders import Order
from .models.admin.service_time import ServiceTime
from .models.manage_cart import ManageCart
from django.contrib import auth


class CategoryAdmin(admin.ModelAdmin):
    readonly_fields = ['image_tag']
    list_display = ['name', 'image_tag']

    # save_on_top = True

    def image_tag(self, obj):
        return format_html(f'<img src= "{obj.image.url}" style="height:150px;width:150px;">')


class ItemsAdmin(admin.ModelAdmin):
    save_on_top = True
    readonly_fields = ['image_tag']
    list_display = ['name', 'price', 'stock', 'category', 'image_tag']

    def image_tag(self, obj):
        return format_html(f'<img src= "{obj.image.url}" style="height:100px;width:100px;">')


class CustomerAdmin(admin.ModelAdmin):
    list_display = ['first_name', 'last_name', 'email', 'mobile']


class CarouselAdmin(admin.ModelAdmin):
    readonly_fields = ['message', 'image_tag']
    list_display = ['id', 'image_tag']

    def image_tag(self, obj):
        return format_html(f'<a href="/admin/cafe/carousel/{obj.id}/change"><img/ src= "{obj.image.url}" style="height'
                           f':150px;width:250px;"></a>')


class OrderAdmin(admin.ModelAdmin):
    save_on_top = True
    list_display = (
        'id', 'customer_name', 'item', 'quantity', 'price', 'total', 'payment_method', 'studentId', 'mobile',
        'status',
        'date')

    def customer_name(self, obj):
        return format_html(f'<a href="/admin/cafe/order/{obj.id}/change">{obj.customer.first_name + " "+ obj.customer.last_name}</a>')

    def make_completed(self, request, queryset):
        if str(self) == 'cafe.OrderAdmin':
            queryset.update(status='Delivered')
            messages.success(request, "Selected Record(s) Marked as completed Successfully !!")
        else:
            messages.warning(request, "This Method is only implementable on order page")

    def make_pending(self, request, queryset):
        if str(self) == 'cafe.OrderAdmin':
            queryset.update(status='Pending')
            messages.success(request, "Selected Record(s) Marked as pending Successfully !!")
        else:
            messages.warning(request, "This Method is only implementable on order page")

    def make_ready(self, request, queryset):
        if str(self) == 'cafe.OrderAdmin':
            queryset.update(status='Ready')
            messages.success(request, "Selected Record(s) Marked as Ready Successfully !!")
        else:
            messages.warning(request, "This Method is only implementable on order page")

    admin.site.add_action(make_completed, "Make Delivered")
    admin.site.add_action(make_pending, "Make Pending")
    admin.site.add_action(make_ready, "Make Ready")


class ServiceTimeAdmin(admin.ModelAdmin):
    readonly_fields = ['message', 'edit']
    list_display = ['edit', 'open', 'close']


class ManageCartAdmin(admin.ModelAdmin):
    list_display = ['id', 'customer', 'quantity']




admin.site.register(Category, CategoryAdmin)
admin.site.register(Items, ItemsAdmin)
#admin.site.register(Customer, CustomerAdmin)
admin.site.register(Carousel, CarouselAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(ServiceTime, ServiceTimeAdmin)
#admin.site.register(ManageCart, ManageCartAdmin)
admin.site.unregister(auth.models.User)
admin.site.unregister(auth.models.Group)
