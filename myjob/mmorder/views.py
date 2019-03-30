from django.contrib.auth.hashers import check_password
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from django.contrib.auth.decorators import login_required

from mmorder.models import FoodsType, Foods, Cart, Order, Orderdetail
from mmorder.views_constant import ORDER_STATUS_NOT_PAY, ORDER_STATUS_NOT_SEND


# 跳转到商品页面
def shop(request):
    return redirect(reverse('mm_order:shop_message', kwargs={"typeid": 3}))


# 详细商品
def shop_message(request, typeid):
    foodtypes = FoodsType.objects.all()
    foodtype = FoodsType.objects.get(pk=typeid)
    foods_list = Foods.objects.filter(fcategory=foodtype.typename)
    for foods in foods_list:
        carts = Cart.objects.filter(foods=foods)
        if carts.exists():
            cart = carts.first()
            foods.cart_food_num = cart.cart_foods_num
    data = {
        'foodtypes': foodtypes,
        'foods_list': foods_list
    }
    return render(request, 'shop.html', data)


# 跳转到购物车
def go_cart(request):
    carts = Cart.objects.filter(user=request.user)
    data = {
        "carts": carts,
        "total_price": total_price(carts)
    }
    return render(request, 'cart.html', data)


# 添加到购物车
def add_to_cart(request):
    foodsid = request.GET.get("foodsid")
    foods = Foods.objects.filter(fid=foodsid).first()
    carts = Cart.objects.filter(user=request.user).filter(foods_id=foodsid)
    if carts:
        cart = carts.first()
        cart.cart_foods_num = cart.cart_foods_num + 1
    else:
        cart = Cart()
        cart.user = request.user
        cart.foods = foods
        cart.cart_foods_num = 1

    cart.save()
    data = {
        "cart_foods_num": cart.cart_foods_num
    }
    return JsonResponse(data)


# 购物车减去商品
def sub_from_cart(request):
    foodsid = request.GET.get("foodsid")

    carts = Cart.objects.filter(user=request.user).filter(foods=foodsid)
    cart = carts.first()

    data = {}

    if cart.cart_foods_num > 1:
        cart.cart_foods_num = cart.cart_foods_num - 1
        cart.save()
        data["cart_foods_num"] = cart.cart_foods_num
    else:
        cart.delete()
        data["cart_foods_num"] = 0

    return JsonResponse(data)


# 在购物车页面点击加号
def add_shopping(request):
    cartid = request.GET.get("cartid")
    cart = Cart.objects.get(pk=cartid)
    cart.cart_foods_num = cart.cart_foods_num + 1
    cart.save()

    user_id = request.session.get("user_id")
    user = User.objects.get(pk=user_id)
    carts = Cart.objects.filter(user=user)
    totalprice = total_price(carts)

    data = {
        "total_price": totalprice,
        "cart_foods_num": cart.cart_foods_num,
        'status': 200
    }

    return JsonResponse(data)


# 购物车点击减号
def sub_shopping(request):
    cartid = request.GET.get("cartid")
    cart = Cart.objects.get(pk=cartid)
    cart.cart_foods_num = cart.cart_foods_num-1
    cart.save()

    if cart.cart_foods_num == 0:
        cart.delete()

    user_id = request.session.get("user_id")
    user = User.objects.get(pk=user_id)
    carts = Cart.objects.filter(user=user)
    totalprice = total_price(carts)
    data = {
        "total_price": totalprice,
        "cart_foods_num": cart.cart_foods_num,
        'status': 200,
    }

    return JsonResponse(data)


# 在购物车页面点击全选
def cart_all_select(request):
    unselected = request.GET.get("cart_list")

    if unselected:
        unselected_list = unselected.split('#')
        for cartid in unselected_list:
            cart = Cart.objects.get(pk=cartid)
            cart.is_selected = True
            cart.save()

    user_id = request.session.get("user_id")
    user = User.objects.get(pk=user_id)
    carts = Cart.objects.filter(user=user)
    totalprice = total_price(carts)

    data = {
        "total_price": totalprice,
        'status': 200,
    }
    return JsonResponse(data)


# 在购物车页面点击购物车条目的选中状态
def change_cart_state(request):
    cartid = request.GET.get("cartid")
    cart = Cart.objects.get(pk=cartid)
    cart.is_selected = not cart.is_selected
    cart.save()

    carts = Cart.objects.filter(user=request.user)
    is_all_select = True
    for cart in carts:
        if not cart.is_selected:
            is_all_select = False
            break

    data = {
        "cart_is_select": cart.is_selected,
        "total_price": total_price(carts),
        "is_all_select": is_all_select,
        'status': 200,
    }

    return JsonResponse(data)


# 下单
def make_order(request):
    order = Order()
    order.user = request.user
    carts = Cart.objects.filter(user=request.user).filter(is_selected=True)
    order.price = total_price(carts)
    order.save()

    for cart in carts:
        orderdetail = Orderdetail()
        orderdetail.order = order
        orderdetail.foods = cart.foods
        orderdetail.order_foods_num = cart.cart_foods_num
        orderdetail.save()
        cart.delete()

    data = {
        'order_id': order.id,
        'status': 200,
    }
    return JsonResponse(data)


# 计算商品总价
def total_price(carts):
    total = 0.0
    for cart in carts:
        if cart.is_selected:   # 判断该记录是否被选中
            total += cart.foods.fprice * cart.cart_foods_num

    return "{:.2f}".format(total)


# 显示订单详情页面
def order_detail(request):
    orderid = request.GET.get("orderid")
    order = Order.objects.get(pk=orderid)
    data = {
        'orders': order,
        'status': 200,
    }

    return render(request, 'order_detail.html', data)


def order_not_pay(request):
    orders = Order.objects.filter(state=ORDER_STATUS_NOT_PAY)
    data = {
        'orders': orders,
        'status': 200
    }

    return render(request, 'order_list_not_pay.html', data)


def pay(request):
    orderid = request.GET.get('orderid')
    order = Order.objects.get(pk=orderid)
    order.state = ORDER_STATUS_NOT_SEND
    order.save()
    data = {
        'status': 200,
        'orderprice': order.price,
    }
    return JsonResponse(data)


def mine(request):
    print("**********")
    user_id = request.session.get('user_id')
    print(user_id,"******2******")
    data = {
        "is_login":False
    }
    if user_id:
        user = User.objects.get(pk=user_id)
        data["is_login"] = True
        data["username"] = user.username
        print(data,"**********")
    return render(request, 'mine.html', data)

#  注册
def register(request):
    if request.method == "GET":
        return render(request, 'register.html')
    elif request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        email = request.POST.get("email")
        # icon = request.FILES.get("icon")
        if not all([username]):
            message = '用户名不能为空'
            return render(request, 'register.html', locals())
        name_1 = User.objects.filter(username=username)
        if name_1:  # 用户名唯一
            message = '用户名存在'
            return render(request, 'register.html', locals())
        if not all([email]):
            message = '邮箱不能为空'
            return render(request, 'register.html', locals())
        email_1 = User.objects.filter(email=email)
        if email_1:
            message = '邮箱存在'
            return render(request, 'register.html', locals())
        if not all([password]):
            message = '密码不能为空'
            return render(request, 'register.html', locals())
        User.objects.create_user(username, email, password)
        return render(request, 'login.html')


#  登录
def login(request):
    if request.method == "GET":
        # error_message =request.session.get("error_message")
        # if error_message:
        #     del request.session["error_message"]
        return render(request, 'login.html')
    elif request.method =="POST":
        errors = {'msg':''}
        username = request.POST.get("username")
        password = request.POST.get("password")
        valid_code =request.POST.get("valid_code") #填写验证码
        queryset = User.objects.filter(username=username)
        if not queryset.exists():
            errors['msg'] = '%s 用户不存在，请先注册!' % username
        else:
            user = queryset.first()
            print(user.id,"*****3*****")
            # 验证口令
            if check_password(password, user.password):
                # 将登录后的信息存入到session中
                # request.session['login_user'] = {
                #     'id': user.id,
                #     'username': user.username,
                # }
                request.session["user_id"] = user.id
                return redirect(reverse('mm_order:mine'))
            else:
                errors['msg'] = '登录口令不正确！'
    return render(request, 'login.html', locals())

def louout(request):
    request.session.flush()
    return redirect(reverse("mm_order:mine"))
