from django.shortcuts import render, redirect
from django.views import View
from cafe.models import Items, ServiceTime, ManageCart
from datetime import datetime
import pytz

from cafe.view.cart_count import Cart_Count

# function to convert 24 hour time format to 12 hour to display
def convert_24_to_12(str):
    res = ''
    # Get Hours
    h1 = ord(str[0]) - ord('0');
    h2 = ord(str[1]) - ord('0');

    hh = h1 * 10 + h2;

    # Finding out the Meridien of time
    # ie. AM or PM
    Meridien = "";
    if (hh < 12):
        Meridien = "AM";
    else:
        Meridien = "PM";

    hh %= 12;

    # Handle 00 and 12 case separately
    if (hh == 0):
        res += "12"

        # Printing minutes and seconds
        for i in range(2, 8):
            res += str[i]

    else:
        res += hh.__str__()

        # Printing minutes and seconds
        for i in range(2, 8):
            res += str[i]

    # After time is printed
    # cout Meridien
    res += " "
    res += Meridien
    return res



class Cart(View):
    def get(self, request):
        data = {}

        # Used in post method
        error = request.GET.get('error')
        if error:
            data['error'] = error
        else:
            data['error'] = None

        # collecting the items for the cart
        customer_id = request.session.get('customer_id')
        items = ManageCart.get_cart_items_by_customer_id(customer_id)
        data['items'] = items

        # checking and sending data to cart page to verify current time is between service open time
        # and service close time

        #get time from asia/kolkata time zone
        tz_IN = pytz.timezone('Asia/Kolkata')
        datetime_IN = datetime.now(tz_IN)

        try:
            service_open = None
            service_close = None
            for serviceTime in ServiceTime.openTime():
                service_open = str(serviceTime.open)
                service_close = str(serviceTime.close)

            # Calculating current time
            current_time = datetime_IN.strftime("%H:%M:%S")

            #creating list of all
            list_open = service_open.split(':')
            list_close = service_close.split(':')
            list_curr = current_time.split(':')

            tmp_open_time = convert_24_to_12(service_open)
            tmp_close_time = convert_24_to_12(service_close)

            open_time = ''
            close_time = ''
            curr_time = ''

            # calculating total hours
            open_time = int(list_open[0]) + int(list_open[1]) / 60 + (int(list_open[2]) / 60)/60
            close_time = int(list_close[0]) + int(list_close[1]) / 60 + (int(list_close[2]) / 60)/60
            curr_time = int(list_curr[0]) + int(list_curr[1]) / 60 + (int(list_curr[2]) / 60)/60

            if open_time <= curr_time < close_time:
                data['service_status'] = True
                data['service_open'] = tmp_open_time
                data['service_close'] = tmp_close_time
            else:
                data['service_status'] = False
                data['service_open'] = tmp_open_time
                data['service_close'] = tmp_close_time
        except:
            data['service_status'] = False
            data['service_open'] = 'Something Went Wrong !!'
            data['service_close'] = 'Try after some time'

        # displaying cart count in the header
        data['cart_count'] = Cart_Count(request)

        # Checking Availability to check out
        data['stock'] = Items.check_stock()

        return render(request, 'cart.html', data)

    def post(self, request):
        item_id = request.POST.get('item_id')
        action = request.POST.get('action')
        quantity = request.POST.get('quantity')
        error = None

        # Incrementing cart item quantity
        if action == 'plus':
            try:
                ManageCart.increase_item_quantity(int(item_id), int(quantity))
            except:
                error = 'Something Went Wrong!!'
                return redirect('/cart')

        # Decrementing cart item quantity
        if action == 'minus':
            if int(quantity) == 1:
                try:
                    ManageCart.remove_item(item_id)
                except:
                    error = 'Something Went Wrong!!'
                    return redirect('/cart?error=', error)
            else:
                try:
                    ManageCart.decrease_item_quantity(int(item_id), int(quantity))
                except:
                    error = 'Something Went Wrong!!'
                    return redirect('/cart?error=', error)

        return redirect('/cart')


