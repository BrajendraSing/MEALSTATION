from cafe.models import ManageCart


def Cart_Count(request):
    # displaying cart count in the header
    if request.session.get('customer_email'):
        id = request.session.get('customer_id')
        items = ManageCart.get_cart_items_by_customer_id(int(id))
        return len(items)
    else:
        return None
