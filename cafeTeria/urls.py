from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from cafe.middlewares.auth import auth_middleware
from django.contrib.auth import views as auth_view
from cafe.view.home import index
from cafe.view.logout import logout
from cafe.view.cart import Cart
from cafe.view.category import CategoryList
from cafe.view.register import Register
from cafe.view.login import Login as UserLogin
from cafe.view.fullmenu import FullMenu
from cafe.view.checkout import CheckOut
from cafe.view.orders import Orders
from cafe.view.forgat_password import ForgetPassword
from cafe.view.reset_password import ResetPassword
# Admin imports
from cafe.view.admin.index import AdminLogin
from cafe.view.admin.dashboard import Dashboard
from cafe.view.admin.add_admin import AddAdmin
from cafe.view.admin.update_admin import UpdateAdmin
from cafe.view.admin.delete_admin import DeleteAdmin
from cafe.view.admin.admin import Admin
from cafe.view.admin.admin_logout import AdminLogout
from cafe.view.admin.category import Category
from cafe.view.admin.add_category import AddCategory
from cafe.view.admin.update_category import UpdateCategory
from cafe.view.admin.delete_category import DeleteCategory
from cafe.view.admin.item import Item
from cafe.view.admin.add_item import AddItem
from cafe.view.admin.update_item import UpdateItem
from cafe.view.admin.delete_item import DeleteItem
from cafe.view.admin.slider import Slider
from cafe.view.admin.add_slider import AddSlider
from cafe.view.admin.update_slider import UpdateSlider
from cafe.view.admin.delete_slider import DeleteSlider
from cafe.view.admin.service_time import ServiceTime
from cafe.view.admin.add_service_time import AddServiceTime
from cafe.view.admin.update_service_time import UpdateServiceTime
from cafe.view.admin.delete_service_time import DeleteSericeTime
from cafe.view.admin.order import OrderView
from cafe.view.admin.update_order import UpdateOrderView
from cafe.view.admin.delete_order import DeleteOrderView
from cafe.view.admin.forget_password import AdminForgetPassword
from cafe.view.admin.reset_password import AdminResetPassword


urlpatterns = [
                 # User urls
                  path('', index.as_view(), name='homepage'),
                  path('register', Register.as_view()),
                  path('category/<catId>', CategoryList.as_view()),
                  path('login', UserLogin.as_view()),
                  path('logout', logout),
                  path('cart', Cart.as_view()),
                  path('menu', FullMenu.as_view()),
                  path('check-out', CheckOut.as_view()),
                  path('orders', auth_middleware(Orders.as_view())),
                  path('forget-password', ForgetPassword.as_view()),
                  path('reset-password/<token>', ResetPassword.as_view()),


                  # Admin urls
                  path('admin/', AdminLogin.as_view(),name="admin_login"),
                  path('admin/forget-password', AdminForgetPassword.as_view(),name="admin_forget_password"),
                  path('admin/reset-password/<token>', AdminResetPassword.as_view()),
                  path('admin-logout/', AdminLogout.as_view(),name="admin_logout"),
                  path('admin/dashboard/', Dashboard.as_view(),name="dashboard"),
                  path('admin/admin',Admin.as_view(),name="admin"),
                  path('admin/add-admin',AddAdmin.as_view(),name="add_admin"),
                  path('admin/update-admin/<int:id>',UpdateAdmin.as_view(),name="update_admin"),
                  path('admin/delete-admin/<int:id>',DeleteAdmin.as_view(),name="delete_admin"),

                  path('admin/category',Category.as_view(),name="category"),
                  path('admin/add-category',AddCategory.as_view(),name="add_category"),
                  path('admin/update-category/<int:id>',UpdateCategory.as_view(),name="update_category"),
                  path('admin/delete-category/<int:id>',DeleteCategory.as_view(),name="delete_category"),

                  path('admin/item/<str:token>',Item.as_view(),name="item"),
                  path('admin/add-item',AddItem.as_view(),name="add_item"),
                  path('admin/update-item/<int:id>',UpdateItem.as_view(),name="update_item"),
                  path('admin/delete-item/<int:id>',DeleteItem.as_view(),name="delete_item"),

                  path('admin/slider',Slider.as_view(),name="slider"),
                  path('admin/add-slider',AddSlider.as_view(),name="add_slider"),
                  path('admin/update-slider/<int:id>',UpdateSlider.as_view(),name="update_slider"),
                  path('admin/delete-slider/<int:id>',DeleteSlider.as_view(),name="delete_slider"),

                  path('admin/service-time',ServiceTime.as_view(),name="service_time"),
                  path('admin/add-service-time',AddServiceTime.as_view(),name="add_service_time"),
                  path('admin/update-service-time/<int:id>',UpdateServiceTime.as_view(),name="update_service_time"),
                  path('admin/delete-service-time/<int:id>',DeleteSericeTime.as_view(),name="delete_service_time"),

                  path('admin/order',OrderView.as_view(),name="order"),
                  path('admin/update-order/<int:id>',UpdateOrderView.as_view(),name="update_order"),
                  path('admin/delete-order/<int:id>',DeleteOrderView.as_view(),name="delete_order"),


              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
