from flask import Blueprint
from app.controllers.web import main_web_controller as controller

main_web_bp = Blueprint('main_web', __name__, url_prefix='')

# main_web routes
main_web_bp.route('/', methods=['GET'])(controller.index)
main_web_bp.route('/tables', methods=['GET'], endpoint='tables')(controller.tables)

# Custom 404 Error Page
@main_web_bp.app_errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404
