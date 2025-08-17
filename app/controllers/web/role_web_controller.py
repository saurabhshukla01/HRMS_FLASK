from flask import render_template, request, redirect, url_for, flash
from app import db
from app.models.role_model import Role

def index():
    # Get filters from query parameters
    role_name_filter = request.args.get('role_name', '').strip()
    page = request.args.get('page', 1, type=int)
    per_page = 20  # adjust as needed

    # Base query
    query = Role.query

    # Apply filters
    if role_name_filter:
        query = query.filter(Role.name.ilike(f"%{role_name_filter}%"))

    # Pagination
    pagination = query.order_by(Role.id.desc()).paginate(page=page, per_page=per_page, error_out=False)
    roles = pagination.items

    return render_template(
        "roles/index.html",    # adjust if your template path differs
        roles=roles,
        pagination=pagination,
        role_name_filter=role_name_filter
    )

def create():
    if request.method == 'POST':
        name = request.form['name']
        role = Role(name=name)
        db.session.add(role)
        db.session.commit()
        flash('Role created successfully!', 'success')
        return redirect(url_for('role_web.index'))
    return render_template('roles/create.html')

def edit(role_id):
    role = Role.query.get_or_404(role_id)
    if request.method == 'POST':
        role.name = request.form['name']
        db.session.commit()
        flash('Role updated successfully!', 'success')
        return redirect(url_for('role_web.index'))
    return render_template('roles/edit.html', role=role)

def delete(role_id):
    role = Role.query.get_or_404(role_id)
    db.session.delete(role)
    db.session.commit()
    flash('Role deleted successfully!', 'success')
    return redirect(url_for('role_web.index'))
