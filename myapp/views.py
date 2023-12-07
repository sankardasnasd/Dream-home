from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from datetime import  datetime

import base64

mediapath = "C:\\22-23\\trendtrove\\media\\"


from myapp.models import *


def login(request):
    request.session['lid']="0"
    return render(request, "admins/login.html")

def log_post(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    var=Login.objects.filter(username=username,password=password)
    if var.exists():
        var1 = Login.objects.get(username=username, password=password)
        request.session['lid']=var1.id
        if var1.type=='admin':
            return redirect('/myapp/admins_home/')
        elif var1.type=='company':
            return redirect('/myapp/chome/')
        elif var1.type=='user':
            return redirect('/myapp/uhome/')
        else:
            return HttpResponse('''<script>alert("Invalid username or password");window.location="/myapp/login/"</script>''')
    else:
        return HttpResponse('''<script>alert("Invalid user name or password");window.location="/myapp/login/"</script>''')




def home(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        return render(request,"admins/home.html")



def admin_add_plan(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        return render(request,"admins/add_plan.html")

def admin_add_plan_post(request):
    title= request.POST["title"]
    description= request.POST["description"]
    file= request.FILES["textfield3"]

    fs = FileSystemStorage()
    from datetime import datetime
    filename = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
    fs.save(filename, file)


    p=plan()
    p.title=title
    p.description= description
    p.file= fs.url(filename)
    p.save()

    return HttpResponse("<script>alert('Plan added successfully');window.location='/myapp/admin_add_plan/'</script>")

def admin_view_plan(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        data= plan.objects.all()
        return  render(request,"admins/Viewplans.html",{'data': data})


def admin_view_plan_post(request):
    name= request.POST["name"]
    data= plan.objects.filter(title__icontains= name)
    return  render(request,"admins/Viewplans.html",{'data': data})


def admin_delete_plan(request,id):

    plan.objects.filter(id=id).delete()
    return HttpResponse("<script>alert('Plan deleted successfully');window.location='/myapp/admin_view_plan/'</script>")


def admin_edit_plan(request, id):
    p=plan.objects.get(id=id)

    return render(request,"admins/edit_plan.html",{'data': p})


def admin_edit_plan_post(request):
    id = request.POST["id"]
    title = request.POST["title"]
    description = request.POST["description"]

    p = plan.objects.get(id=id)
    p.title = title
    p.description = description


    if 'textfield3' in request.FILES:
        file = request.FILES["textfield3"]

        fs = FileSystemStorage()
        from datetime import datetime
        filename = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
        fs.save(filename, file)
        p.file = fs.url(filename)

    p.save()

    return HttpResponse("<script>alert('Plan edited successfully');window.location='/myapp/admin_add_plan/'</script>")


def admins_view_complaints(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        c=Complaint.objects.all()
        return render(request, "admins/Viewcomplaint.html", {'data': c})

def admins_view_complaints_post(request):
    f=request.POST["f"]
    t=request.POST["t"]
    c = Complaint.objects.filter(date__range=[f,t])
    return render(request, "admins/Viewcomplaint.html", {'data': c})

def admins_sent_reply(request,id):
    return render(request,"admins/sentreply.html",{'id':id})

def admins_sent_reply_post(request):
    id= request.POST["id"]
    reply= request.POST["reply"]
    c=Complaint.objects.get(id=id)
    c.reply= reply
    c.status="replied"
    c.save()
    return HttpResponse("<script>alert('Replied successfully');window.location='/myapp/admins_view_complaints/'</script>")



def admin_change_password(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        return render(request, "admins/change password.html")

def admin_changepas_post(request):
    currentpassword = request.POST['textfield']
    newpassword = request.POST['textfield2']
    confirmpassword = request.POST['textfield3']
    res=Login.objects.filter(password=currentpassword,id=request.session['lid'])
    if res.exists():
        res1 = Login.objects.get(password=currentpassword, id=request.session['lid'])
        if newpassword==confirmpassword:
            res2 = Login.objects.filter(password=currentpassword, id=request.session['lid']).update(password=confirmpassword)
            return HttpResponse('''<script>alert("Changed Successfully");window.location="/myapp/login/"</script>''')
        else :
            return HttpResponse('''<script>alert("Password mismatch");window.location="/myapp/change_password/"</script>''')
    else :
        return HttpResponse('''<script>alert("Invalid password");window.location="/myapp/change_password/"</script>''')

def home(request):
    if request.session["lid"] == "0":
        return redirect('/myapp/login/')
    else:
        return render(request, "admins/home.html")

def admin_view_pending_companies(request):
    if request.session["lid"] == "0":
        return redirect('/myapp/login/')
    else:
        data= Company.objects.filter(status="pending")
        return render(request, "admins/View_pending_companies.html",{'data':data})


def admin_view_pending_companies_search(request):
    if request.session["lid"] == "0":
        return redirect('/myapp/login/')
    else:

        name= request.POST["s"]
        data= Company.objects.filter(status="pending",name__icontains=name)
        return render(request, "admins/View_pending_companies.html",{'data':data})


def admin_aprv_company(request,id):

    s=Company.objects.get(id=id)
    s.status="approved"
    s.save()
    return HttpResponse("<script>alert('Company approved');window.location='/myapp/admin_view_pending_companies/'</script>")

def admin_reject_company(request,id):

    s=Company.objects.get(id=id)
    s.status="rejected"
    s.save()
    return HttpResponse("<script>alert('Company Rejected');window.location='/myapp/admin_view_pending_companies/'</script>")
    



def admin_view_approved_companies(request):
    if request.session["lid"] == "0":
        return redirect('/myapp/login/')
    else:
        data= Company.objects.filter(status="approved")
        return render(request, "admins/View_approved_companies.html",{'data':data})


def admin_view_approved_companies_search(request):
    if request.session["lid"] == "0":
        return redirect('/myapp/login/')
    else:

        name = request.POST["s"]
        data = Company.objects.filter(status="approved", name__icontains=name)
        return render(request, "admins/View_approved_companies.html", {'data': data})





def admin_view_rejected_companies(request):
    if request.session["lid"] == "0":
        return redirect('/myapp/login/')
    else:
        data = Company.objects.filter(status="rejected")
        return render(request, "admins/View_rejected_companies.html", {'data': data})

def admin_view_rejected_companies_search(request):
    if request.session["lid"] == "0":
        return redirect('/myapp/login/')
    else:

        name = request.POST["s"]
        data = Company.objects.filter(status="rejected",name__icontains=name)
        return render(request, "admins/View_rejected_companies.html", {'data': data})


########################




def company_signup(request):
    return render(request,"company/signup.html")


def company_signup_post(request):
    name = request.POST["textfield"]

    housename = request.POST["textfield2"]
    place = request.POST["textfield3"]
    city = request.POST["textfield4"]
    state = request.POST["textfield5"]
    email = request.POST["textfield6"]
    phone = request.POST["textfield7"]
    estd = request.POST["estd"]
    manager = request.POST["manager"]

    password = request.POST["textfield10"]
    file = request.FILES["fileField"]
    fs = FileSystemStorage()
    from datetime import datetime
    filename = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
    fs.save(filename, file)
    l = Login()
    l.username = email
    l.password= password
    l.type = "company"
    l.save()

    cobj = Company()
    cobj.name = name

    cobj.housename = housename
    cobj.place = place
    cobj.email = email
    cobj.city = city
    cobj.state = state
    cobj.phone = phone
    cobj.LOGIN = l
    cobj.photo = fs.url(filename)
    cobj.managername= manager
    cobj.estd=estd

    cobj.save()

    return HttpResponse("<script>alert('Account created successfully');window.location='/myapp/login/'</script>")



def chome(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        return render(request,"company/index.html")


def company_add_category(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        return render(request,"company/category_add.html")

def company_add_category_post(request):
    c=request.POST["textfield1"]
    cc= category()
    cc.categoryname=c
    cc.COMPANY= Company.objects.get(LOGIN_id= request.session['lid'])
    cc.save()

    return HttpResponse("<script>alert('Category added successfully');window.location='/myapp/company_add_category/'</script>")

def company_view_category(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        data=category.objects.filter(COMPANY__LOGIN__id= request.session['lid'])
        return render(request,"company/View_category.html",{'data':data})

def company_view_category_post(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        name= request.POST["textfield"]
        data=category.objects.filter(COMPANY__LOGIN__id= request.session['lid'],categoryname__icontains=name )
        return render(request,"company/View_category.html",{'data':data})


def company_delete_category(request,id):

    category.objects.filter(id=id).delete()

    return HttpResponse(
        "<script>alert('Category added successfully');window.location='/myapp/company_view_category/'</script>")


def company_add_product(request):

    if request.session["lid"]=="0":
        return redirect('/myapp/login/')

    else:
        c=category.objects.filter(COMPANY__LOGIN__id= request.session['lid'])

        return render(request,"company/product_add.html",{'data': c})

def company_add_product_post(request):
    name= request.POST["product"]
    file= request.FILES["file"]
    price= request.POST["price"]
    description= request.POST["description"]
    cat= request.POST["cat"]

    fs = FileSystemStorage()
    from datetime import datetime
    filename = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
    fs.save(filename, file)

    p=product()
    p.name=name
    p.description=description
    p.price=price
    p.photo= fs.url(filename)
    p.CATEGORY_id=cat
    p.save()

    return HttpResponse("<script>alert('Product added successfully');window.location='/myapp/company_add_product/'</script>")

def company_view_product(request):

    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        data=product.objects.filter(CATEGORY__COMPANY__LOGIN_id= request.session['lid'])

        return render(request, "company/View_product.html", {'data': data})



def company_search_product(request):
    name= request.POST["name"]

    data = product.objects.filter(CATEGORY__COMPANY__LOGIN_id=request.session['lid'], name__icontains= name)

    return render(request, "company/View_product.html", {'data': data})

def company_delete_product(request,id):

    product.objects.filter(id= id).delete()

    return HttpResponse("<script>alert('Product deleted successfully');window.location='/myapp/company_view_product/'</script>")


def company_edit_product(request, id):
    c = category.objects.filter(COMPANY__LOGIN__id=request.session['lid'])
    data = product.objects.get(id=id)

    return render(request, "company/product_edit.html", {'c': c, 'data': data})


def company_edit_product_post(request):
    name = request.POST["product"]

    price = request.POST["price"]
    description = request.POST["description"]
    cat = request.POST["cat"]
    id = request.POST["id"]


    p = product.objects.get(id=id)
    p.name = name
    p.description = description
    p.price = price

    if 'file' in request.FILES:

        file = request.FILES["file"]
        fs = FileSystemStorage()
        from datetime import datetime
        filename = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
        fs.save(filename, file)
        p.photo = fs.url(filename)

    p.CATEGORY_id = cat
    p.save()

    return HttpResponse(
        "<script>alert('Product edited successfully');window.location='/myapp/company_view_product/'</script>")


def company_change_password(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:

        return render(request, "company/change password.html")

def company_changepas_post(request):
    currentpassword = request.POST['textfield']
    newpassword = request.POST['textfield2']
    confirmpassword = request.POST['textfield3']
    res = Login.objects.filter(password=currentpassword, id=request.session['lid'])
    if res.exists():
        res1 = Login.objects.get(password=currentpassword, id=request.session['lid'])
        if newpassword == confirmpassword:
            res2 = Login.objects.filter(password=currentpassword, id=request.session['lid']).update(
                password=confirmpassword)
            return HttpResponse(
                '''<script>alert("Changed Successfully");window.location="/myapp/login/"</script>''')
        else:
            return HttpResponse(
                '''<script>alert("Password mismatch");window.location="/myapp/login/"</script>''')
    else:
        return HttpResponse(
            '''<script>alert("Invalid password");window.location="/myapp/login/"</script>''')




def company_view_users(request):

    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        data=User.objects.all()

        return render(request,"company/view_users.html",{'data': data})


def company_view_users_search(request):

    name= request.POST["s"]


    data=User.objects.filter(name__icontains=name)


    return render(request,"company/view_users.html",{'data': data})



def company_view_order(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        data=ordermain.objects.filter(COMPANY__LOGIN_id= request.session['lid'])
        return render(request,"company/Vieworders.html",{'data':data})


def company_view_ordermain_post(request):

    f=request.POST["f"]
    t=request.POST["t"]

    data= ordermain.objects.filter(USER__LOGIN__id= request.session['lid'],date__range=[f,t])

    return render(request,"company/Vieworders.html",{'data': data})




def company_view_ordersub(request,id):

    data= ordersub.objects.filter(ORDERMAIN__id=id)

    return render(request, "company/Viewordersub.html", {'data': data})




def company_view_profile(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        data=Company.objects.get(LOGIN_id= request.session['lid'])

        return render(request,"company/viewprofile.html",{'u': data})


##################user portion

def uhome(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        return render(request,"user/home.html")

def user_signup(request):
    return render(request, "user/signup.html")

def user_signup_post(request):
    name = request.POST["textfield"]
    gender = request.POST["select"]
    housename = request.POST["textfield2"]
    place = request.POST["textfield3"]
    city = request.POST["textfield4"]
    state = request.POST["textfield5"]
    email = request.POST["textfield6"]
    phone = request.POST["textfield7"]

    password = request.POST["textfield10"]
    file = request.FILES["fileField"]
    fs = FileSystemStorage()
    from datetime import datetime
    filename = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
    fs.save(filename, file)
    l = Login()
    l.username = email
    l.password= password
    l.type = "user"
    l.save()

    cobj = User()
    cobj.name = name
    cobj.gender = gender
    cobj.housename = housename
    cobj.place = place
    cobj.email = email
    cobj.city = city
    cobj.state = state
    cobj.phone = phone
    cobj.LOGIN = l
    cobj.photo = fs.url(filename)

    cobj.save()

    return HttpResponse("<script>alert('Account created successfully');window.location='/myapp/login/'</script>")




def user_view_profile(request):
    if request.session["lid"]=="0":
        return redirect('/myapp/login/')
    else:
        u=User.objects.get(LOGIN_id=request.session['lid'])
        return  render(request,"user/viewprofile.html",{'u':u })



def user_edit_profile(request):
    u = User.objects.get(LOGIN_id=request.session['lid'])
    return render(request, "user/editprofile.html", {'u': u})



def user_editprofile_post(request):

    name = request.POST["textfield"]
    gender = request.POST["select"]
    housename = request.POST["textfield2"]
    place = request.POST["textfield3"]
    city = request.POST["textfield4"]
    state = request.POST["textfield5"]
    email = request.POST["textfield6"]
    phone = request.POST["textfield7"]


    cobj = User.objects.get(LOGIN_id=request.session['lid'])
    cobj.name = name
    cobj.gender = gender
    cobj.housename = housename
    cobj.place = place
    cobj.email = email
    cobj.city = city
    cobj.state = state
    cobj.phone = phone

    if 'fileField' in request.FILES:
        file = request.FILES["fileField"]

        fs = FileSystemStorage()
        from datetime import datetime
        filename = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
        fs.save(filename, file)

        cobj.photo = fs.url(filename)

    cobj.save()

    return HttpResponse("<script>alert('Account edited successfully');window.location='/myapp/user_view_profile/'</script>")


def user_add_complaint(request):
    return render(request,"user/sentcomplaint.html")
def user_add_complaint_post(request):
    complaint= request.POST["complaint"]

    c=Complaint()
    c.USER= User.objects.get(LOGIN_id= request.session['lid'])
    c.complaint=complaint
    c.reply="pending"
    c.status="pending"
    c.date=datetime.now()
    c.save()





    return HttpResponse("<script>alert('Complaint sent successfully');window.location='/myapp/user_add_complaint/'</script>")




def user_view_complaint(request):
    fall = Complaint.objects.filter(USER__LOGIN_id= request.session['lid'])
    return render(request, "user/Viewcomplaint.html", {'fall': fall})


def user_view_complaint_post(request):

    f=request.POST["f"]
    t=request.POST["t"]

    fall = Complaint.objects.filter(USER__LOGIN_id= request.session['lid'], date__range=[f,t])
    return render(request, "user/Viewcomplaint.html", {'fall': fall})




def student_change_password(request):
    return render(request, "user/change password.html")

def student_changepas_post(request):
    currentpassword = request.POST['textfield']
    newpassword = request.POST['textfield2']
    confirmpassword = request.POST['textfield3']
    res=Login.objects.filter(password=currentpassword,id=request.session['lid'])
    if res.exists():
        res1 = Login.objects.get(password=currentpassword, id=request.session['lid'])
        if newpassword==confirmpassword:
            res2 = Login.objects.filter(password=currentpassword, id=request.session['lid']).update(password=confirmpassword)
            return HttpResponse('''<script>alert("Changed Successfully");window.location="/myapp/login/"</script>''')
        else :
            return HttpResponse('''<script>alert("Password mismatch");window.location="/myapp/student_change_password/"</script>''')
    else :
        return HttpResponse('''<script>alert("Invalid password");window.location="/myapp/student_change_password/"</script>''')




def user_view_products(request):

    data=product.objects.all()

    return render(request,"user/View_product.html",{'data': data})

def user_search_product(request):
    name= request.POST["name"]

    data = product.objects.filter(CATEGORY__COMPANY__LOGIN_id=request.session['lid'], name__icontains= name)

    return render(request, "user/View_product.html", {'data': data})



def user_add_cart(request):
    pid= request.POST["id"]
    qty= request.POST["qty"]

    c=cart()
    c.PRODUCT_id=pid
    c.qty= qty
    c.USER= User.objects.get(LOGIN_id= request.session['lid'])
    c.date= datetime.now()
    c.save()


    return HttpResponse("<script>alert('Add to cart successfully');window.location='/myapp/user_view_products/'</script>")



def user_view_cart(request):

    data= cart.objects.filter(USER__LOGIN__id= request.session['lid'])


    l=len(data)

    amount=0
    for i in data:

        amount= amount + (float(i.PRODUCT.price) * float(i.qty))




    print(data)
    return render(request,"user/user_view_cart.html",{'data':data,'l':l,'amount':amount})

def user_delete_cart(request,id):

    cart.objects.filter(id=id).delete()

    return HttpResponse("<script>alert('Cart deleted successfully');window.location='/myapp/user_view_cart/'</script>")



def user_pay(request):
    accountno= request.POST["accountno"]
    ifsc= request.POST["ifsc"]
    password= request.POST["password"]
    total= request.POST["total"]

    if bank.objects.filter(accountno=accountno,ifsccode= ifsc, password=password,amount__gt=total).exists():

        data = cart.objects.filter(USER__LOGIN__id=request.session['lid'])
        s=[]
        for i in data:
            if i.PRODUCT.CATEGORY.COMPANY.id not in s:
                s.append(i.PRODUCT.CATEGORY.COMPANY.id)

        for i in s:
            data = cart.objects.filter(USER__LOGIN__id=request.session['lid'],PRODUCT__CATEGORY__COMPANY__id=i)

            amount = 0
            for ii in data:
                amount = amount + (float(ii.PRODUCT.price) * float(ii.qty))

            om=ordermain()
            om.USER= User.objects.get(LOGIN__id= request.session['lid'])
            om.COMPANY_id=i
            om.amount=amount
            om.date= datetime.now()
            om.save()

            for i in data:
                osub= ordersub()
                osub.PRODUCT=i.PRODUCT
                osub.qty=i.qty
                osub.ORDERMAIN=om
                osub.save()

        cart.objects.filter(USER__LOGIN__id=request.session['lid']).delete()

        return HttpResponse("<script>alert('Payment done successfully');window.location='/myapp/user_view_cart/'</script>")







    else:

        return HttpResponse("<script>alert('Invalid bank details');window.location='/myapp/user_view_cart/'</script>")




def user_view_ordermain(request):

    data= ordermain.objects.filter(USER__LOGIN__id= request.session['lid'])

    return render(request,"user/Vieworders.html",{'data': data})


def user_view_ordermain_post(request):

    f=request.POST["f"]
    t=request.POST["t"]

    data= ordermain.objects.filter(USER__LOGIN__id= request.session['lid'],date__range=[f,t])

    return render(request,"user/Vieworders.html",{'data': data})




def user_view_ordersub(request,id):

    data= ordersub.objects.filter(ORDERMAIN__id=id)

    return render(request, "user/Viewordersub.html", {'data': data})



def user_send_feedback(request):
    return  render(request,"user/sentfeedback.html")

def user_send_feedback_post(request):

    f=request.POST["f"]

    ff=Feedback()
    ff.USER=User.objects.get(LOGIN__id= request.session["lid"])
    ff.date= datetime.now()
    ff.save()

    return HttpResponse("<Script>alert('Feedback sent successfully');window.location='/myapp/user_send_feedback'</script>")

