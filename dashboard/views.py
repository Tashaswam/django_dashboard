from django.shortcuts import render
from django.http import HttpResponseForbidden
from django.contrib.auth.decorators import login_required

@login_required
def home(request):
    user = request.user
    role = 'Admin' if user.is_superuser else 'Normal User'
    return render(request, 'dashboard/home.html', {'user': user, 'role': role})

@login_required
def admin_dashboard(request):
    if not request.user.is_superuser:
        return HttpResponseForbidden("❌ You don’t have permission to access this page.")
    return render(request, 'dashboard/admin_dashboard.html')

@login_required
def user_dashboard(request):
    if request.user.is_superuser:
        return HttpResponseForbidden("❌ Admins should use the Admin Dashboard.")
    return render(request, 'dashboard/user_dashboard.html')

