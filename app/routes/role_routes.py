from flask import Blueprint
from app.controllers.api import role_controller

role_bp = Blueprint('role_bp', __name__, url_prefix='/api/roles')

role_bp.route('/', methods=['GET'])(role_controller.get_all_roles)
role_bp.route('/<int:role_id>', methods=['GET'])(role_controller.get_role)
role_bp.route('/', methods=['POST'])(role_controller.create_role)
role_bp.route('/<int:role_id>', methods=['PUT'])(role_controller.update_role)
role_bp.route('/<int:role_id>', methods=['DELETE'])(role_controller.delete_role)
