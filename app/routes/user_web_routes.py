from flask import Blueprint
from app.controllers.web import user_web_controller as controller

user_web_bp = Blueprint('user_web', __name__, url_prefix='/users')

# user_web routes
user_web_bp.route('/', methods=['GET'], endpoint='users')(controller.index)
user_web_bp.route('/create', methods=['GET', 'POST'], endpoint='create_user')(controller.create)
user_web_bp.route('/edit/<int:user_id>', methods=['GET', 'POST'], endpoint='edit_user')(controller.edit)
user_web_bp.route('/delete/<int:user_id>', methods=['POST'], endpoint='delete_user')(controller.delete)
