from flask import Blueprint
from app.controllers.web import role_web_controller as controller

role_web_bp = Blueprint('role_web', __name__, url_prefix='/roles')

# role_web routes
role_web_bp.route('/', methods=['GET'], endpoint='roles')(controller.index)
role_web_bp.route('/create', methods=['GET', 'POST'], endpoint='create_role')(controller.create)
role_web_bp.route('/edit/<int:role_id>', methods=['GET', 'POST'], endpoint='edit_role')(controller.edit)
role_web_bp.route('/delete/<int:role_id>', methods=['POST'], endpoint='delete_role')(controller.delete)

