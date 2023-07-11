from django import template

register = template.Library()


@register.filter(name='currency')
def currency(number):
    return "₹ " + str(number)


@register.filter(name='multiply')
def multiply(number, number1):
    return number * number1


@register.filter(name='cart_total')
def cart_total(items, stock):
    lst_stock  = []
    total = 0
    for i_stock in stock:
        lst_stock.append(str(i_stock))

    for item in items:
        if str(item.item.name) in lst_stock:
            total += item.item.price * item.quantity

    return total


@register.filter(name='availabe')
def availabe(cart, items):
    for item in cart:
        if int(item.item.id) == int(items.id):
            return True
    return False
