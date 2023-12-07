from django.db import models

# Create your models here.


class Login(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)

class User(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    gender=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    photo = models.CharField(max_length=500,default="A")
    housename= models.CharField(max_length=100)
    place= models.CharField(max_length=100)
    city= models.CharField(max_length=100)
    state= models.CharField(max_length=100)




class Company(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)

    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    photo = models.CharField(max_length=500,default="A")
    buildingno= models.CharField(max_length=100)
    place= models.CharField(max_length=100)
    city= models.CharField(max_length=100)
    state= models.CharField(max_length=100)
    estd= models.CharField(max_length=100)
    managername= models.CharField(max_length=100)
    status= models.CharField(max_length=100,default="pending")






class Complaint(models.Model):
    complaint= models.CharField(max_length=500)
    USER= models.ForeignKey(User, on_delete=models.CASCADE)
    date= models.DateField()
    status= models.CharField(max_length=20,default="pending")
    reply= models.CharField(max_length=20,default="pending")


class bank(models.Model):

    accountno= models.CharField(max_length=100)
    ifsccode= models.CharField(max_length=100)
    password= models.CharField(max_length=100)
    amount= models.FloatField(max_length=100)

class category(models.Model):
    categoryname= models.CharField(max_length=50)
    COMPANY= models.ForeignKey(Company, on_delete=models.CASCADE)


class plan(models.Model):
    title= models.CharField(max_length=100)
    description= models.CharField(max_length=500)
    file= models.CharField(max_length=500)


class product(models.Model):
    name= models.CharField(max_length=100)
    CATEGORY= models.ForeignKey(category,on_delete=models.CASCADE)
    photo= models.CharField(max_length=250)
    price= models.CharField(max_length=8)
    description= models.CharField(max_length=200)

class ordermain(models.Model):
    date= models.DateField()
    COMPANY= models.ForeignKey(Company,on_delete=models.CASCADE)
    USER= models.ForeignKey(User,on_delete=models.CASCADE)
    amount= models.FloatField()


class ordersub(models.Model):
    ORDERMAIN = models.ForeignKey(ordermain, on_delete=models.CASCADE)
    PRODUCT = models.ForeignKey(product, on_delete=models.CASCADE)
    qty= models.IntegerField()


class cart(models.Model):
    PRODUCT = models.ForeignKey(product, on_delete=models.CASCADE)
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    qty = models.IntegerField()
    date=models.DateField()


#
# class bank(models.Model):
#     account= models.CharField(max_length=100)
#     ifsc= models.CharField(max_length=100)
#     password= models.CharField(max_length=100)
#     amount= models.FloatField()






class Feedback(models.Model):
    feedback= models.CharField(max_length=500)
    USER= models.ForeignKey(User, on_delete=models.CASCADE)
    date= models.DateField()
