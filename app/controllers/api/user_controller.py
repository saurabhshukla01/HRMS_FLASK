from app import db
from app.models.user_model import User
from flask import jsonify, request

def get_all_users():
    users = User.query.all()
    return jsonify([
        {
            'id': u.id,
            'uuid': u.uuid,
            'name': u.name,
            'email': u.email,
            'role': {
                'id': u.role.id if u.role else None,
                'uuid': u.role.uuid if u.role else None,
                'name': u.role.name if u.role else None
            } if u.role else None
        } for u in users
    ])

def get_user(user_id):
    user = User.query.get_or_404(user_id)
    return jsonify({
        'id': user.id,
        'uuid': user.uuid,
        'name': user.name,
        'email': user.email,
        'role': {
            'id': user.role.id if user.role else None,
            'uuid': user.role.uuid if user.role else None,
            'name': user.role.name if user.role else None
        } if user.role else None
    })

def create_user():
    data = request.json
    user = User(
        name=data['name'],
        email=data['email'],
        password=data['password'],  # hash it in real apps
        role_id=data.get('role_id')
    )
    db.session.add(user)
    db.session.commit()
    return jsonify({'message': 'User created successfully'}), 201

def update_user(user_id):
    user = User.query.get_or_404(user_id)
    data = request.json
    user.name = data.get('name', user.name)
    user.email = data.get('email', user.email)
    user.password = data.get('password', user.password)
    user.role_id = data.get('role_id', user.role_id)
    db.session.commit()
    return jsonify({'message': 'User updated successfully'})

def delete_user(user_id):
    user = User.query.get_or_404(user_id)
    db.session.delete(user)
    db.session.commit()
    return jsonify({'message': 'User deleted successfully'})
