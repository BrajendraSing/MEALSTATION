from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from cafe.view.home import index
from cafe.view.logout import logout
from cafe.view.cart import Cart
from cafe.view.category import CategoryList
from cafe.view.register import Register
from cafe.view.login import Login
from cafe.view.fullmenu import FullMenu
from cafe.view.checkout import CheckOut
from cafe.view.orders import Orders
from cafe.view.forgat_password import ForgetPassword
from cafe.view.reset_password import ResetPassword
from cafe.middlewares.auth import auth_middleware
from django.contrib.auth import views as auth_view


urlpatterns = [
                  path('admin/', admin.site.urls),
                  path('accounts/login/', admin.site.urls),
                  path('', index.as_view(), name='homepage'),
                  path('register', Register.as_view()),
                  path('category/<catId>', CategoryList.as_view()),
                  path('login', Login.as_view()),
                  path('logout', logout),
                  path('cart', Cart.as_view()),
                  path('menu', FullMenu.as_view()),
                  path('check-out', CheckOut.as_view()),
                  path('orders', auth_middleware(Orders.as_view())),
                  path('forget-password', ForgetPassword.as_view()),
                  path('reset-password/<token>', ResetPassword.as_view()),


                  # Admin password reset urls
                  path('reset_password/', auth_view.PasswordResetView.as_view(), name="admin_password_reset"),
                  path('reset_password_sent/', auth_view.PasswordResetDoneView.as_view(), name="password_reset_done"),
                  path('reset/<uidb64>/<token>/', auth_view.PasswordResetConfirmView.as_view(),
                       name="password_reset_confirm"),
                  path('reset_password_complete/', auth_view.PasswordResetCompleteView.as_view(),
                       name="password_reset_complete"),

              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
