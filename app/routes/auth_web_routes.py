from flask import Blueprint
from app.controllers.web import auth_web_controller as controller

auth_web_bp = Blueprint('auth_web', __name__, url_prefix='')

# auth_web routes
auth_web_bp.route('/login', methods=['GET'] , endpoint='login')(controller.login)
auth_web_bp.route('/register', methods=['GET'], endpoint='register')(controller.register)
auth_web_bp.route('/forgot-password', methods=['GET'], endpoint='forgot_password')(controller.forgot_password)

