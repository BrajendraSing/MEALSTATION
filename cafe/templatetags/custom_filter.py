from django import template

register = template.Library()

@register.filter(name='in_stock')
def in_stock(stock, item):
    for s_item in stock:
        if str(s_item) == item:
            return True
    return False