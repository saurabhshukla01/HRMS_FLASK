from flask import Blueprint, render_template

auth_web = Blueprint('auth_web', __name__)

@auth_web.route('/login')
def login():
    return render_template('auth/login.html')

@auth_web.route('/register')
def register():
    return render_template('auth/register.html')

@auth_web.route('/forgot-password')
def forgot_password():
    return render_template('auth/forgot-password.html')
