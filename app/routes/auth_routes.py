from flask import Blueprint, jsonify

user_bp = Blueprint('user_bp', __name__)

@user_bp.route('/users', methods=['GET'])
def get_users():
    # Temporary demo route
    return jsonify({"message": "Users route working!"})
