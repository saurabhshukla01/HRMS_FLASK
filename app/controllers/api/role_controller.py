from app import db
from app.models.role_model import Role
from flask import jsonify, request

def get_all_roles():
    roles = Role.query.all()
    return jsonify([{
        'id': r.id,
        'uuid': r.uuid,
        'name': r.name
    } for r in roles])

def get_role(role_id):
    role = Role.query.get_or_404(role_id)
    return jsonify({
        'id': role.id,
        'uuid': role.uuid,
        'name': role.name
    })

def create_role():
    data = request.json
    role = Role(name=data['name'])
    db.session.add(role)
    db.session.commit()
    return jsonify({'message': 'Role created successfully'}), 201

def update_role(role_id):
    role = Role.query.get_or_404(role_id)
    data = request.json
    role.name = data.get('name', role.name)
    db.session.commit()
    return jsonify({'message': 'Role updated successfully'})

def delete_role(role_id):
    role = Role.query.get_or_404(role_id)
    db.session.delete(role)
    db.session.commit()
    return jsonify({'message': 'Role deleted successfully'})
