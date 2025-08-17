from flask import Blueprint
from app.controllers.api import user_controller

user_bp = Blueprint('user_bp', __name__, url_prefix='/api/users')

user_bp.route('/', methods=['GET'])(user_controller.get_all_users)
user_bp.route('/<int:user_id>', methods=['GET'])(user_controller.get_user)
user_bp.route('/', methods=['POST'])(user_controller.create_user)
user_bp.route('/<int:user_id>', methods=['PUT'])(user_controller.update_user)
user_bp.route('/<int:user_id>', methods=['DELETE'])(user_controller.delete_user)
