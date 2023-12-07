
from django.contrib import admin
from django.urls import path, include

from myapp import views

urlpatterns = [
    path('login/',views.login),
    path('login_post/',views.log_post),
    path('admins_home/',views.home),

    path('admins_view_complaints/',views.admins_view_complaints),
    path('admins_view_complaints_post/',views.admins_view_complaints_post),
    path('admins_sent_reply/<id>',views.admins_sent_reply),
    path('admins_sent_reply_post/',views.admins_sent_reply_post),
    path('admin_change_password/',views.admin_change_password),
    path('admin_changepas_post/',views.admin_changepas_post),



    path('admin_view_pending_companies/',views.admin_view_pending_companies),
    path('admin_view_pending_companies_search/',views.admin_view_pending_companies_search),
    path('admin_aprv_company/<id>',views.admin_aprv_company),
    path('admin_reject_company/<id>',views.admin_reject_company),
    path('admin_view_approved_companies/',views.admin_view_approved_companies),
    path('admin_view_approved_companies_search/',views.admin_view_approved_companies_search),
    path('admin_view_rejected_companies/',views.admin_view_rejected_companies),
    path('admin_view_rejected_companies_search/',views.admin_view_rejected_companies_search),


    path('admin_add_plan/',views.admin_add_plan),
    path('admin_add_plan_post/',views.admin_add_plan_post),
    path('admin_view_plan/',views.admin_view_plan),
    path('admin_view_plan_post/',views.admin_view_plan_post),
    path('admin_delete_plan/<id>',views.admin_delete_plan),
    path('admin_edit_plan/<id>',views.admin_edit_plan),
    path('admin_edit_plan_post/',views.admin_edit_plan_post),






    path('uhome/',views.uhome),
    path('user_signup/',views.user_signup),
    path('user_signup_post/',views.user_signup_post),
    path('user_view_profile/',views.user_view_profile),
    path('user_edit_profile/',views.user_edit_profile),
    path('user_editprofile_post/',views.user_editprofile_post),
    path('user_add_complaint/',views.user_add_complaint),
    path('user_add_complaint_post/',views.user_add_complaint_post),
    path('user_view_complaint/',views.user_view_complaint),
    path('user_view_complaint_post/',views.user_view_complaint_post),
    path('student_change_password/',views.student_change_password),
    path('student_changepas_post/',views.student_changepas_post),
    path('user_view_products/',views.user_view_products),
    path('user_search_product/',views.user_search_product),
    path('user_view_cart/',views.user_view_cart),
    path('user_add_cart/',views.user_add_cart),
    path('user_delete_cart/<id>',views.user_delete_cart),
    path('user_pay/',views.user_pay),
    path('user_view_ordermain/',views.user_view_ordermain),
    path('user_view_ordermain_post/',views.user_view_ordermain_post),
    path('user_view_ordersub/<id>',views.user_view_ordersub),
    path('user_send_feedback/',views.user_send_feedback),
    path('user_send_feedback_post/',views.user_send_feedback_post),


    path('company_signup/',views.company_signup),
    path('company_signup_post/',views.company_signup_post),
    path('chome/',views.chome),
    path('company_add_category/',views.company_add_category),
    path('company_add_category_post/',views.company_add_category_post),
    path('company_view_category/',views.company_view_category),
    path('company_view_category_post/',views.company_view_category_post),
    path('company_delete_category/<id>',views.company_delete_category),


    path('company_add_product/',views.company_add_product),
    path('company_add_product_post/',views.company_add_product_post),
    path('company_view_product/',views.company_view_product),
    path('company_search_product/',views.company_search_product),
    path('company_delete_product/<id>',views.company_delete_product),
    path('company_edit_product/<id>',views.company_edit_product),
    path('company_edit_product_post/',views.company_edit_product_post),


    path('company_change_password/',views.company_change_password),
    path('company_changepas_post/',views.company_changepas_post),


    path('company_view_users/',views.company_view_users),
    path('company_view_users_search/',views.company_view_users_search),

    path('company_view_order/',views.company_view_order),
    path('company_view_ordermain_post/',views.company_view_ordermain_post),
    path('company_view_ordersub/<id>',views.company_view_ordersub),
    path('company_view_profile/',views.company_view_profile),










]
