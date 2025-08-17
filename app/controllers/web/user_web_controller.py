from flask import render_template, request, redirect, url_for, flash
from app import db
from app.models.user_model import User
from app.models.role_model import Role

def index():
    # Get filters from query parameters
    role_filter = request.args.get('role', type=int)
    name_filter = request.args.get('name', '').strip()
    email_filter = request.args.get('email', '').strip()
    page = request.args.get('page', 1, type=int)
    per_page = 100  # adjust as needed

    # Base query with join so we can access role name directly
    query = db.session.query(User, Role.name.label("role_name")).outerjoin(Role, User.role_id == Role.id)

    # Apply filters
    if role_filter:
        query = query.filter(User.role_id == role_filter)
    if name_filter:
        query = query.filter(User.name.ilike(f"%{name_filter}%"))
    if email_filter:
        query = query.filter(User.email.ilike(f"%{email_filter}%"))

    # Pagination
    pagination = query.order_by(User.id.desc()).paginate(page=page, per_page=per_page, error_out=False)
    users = [
        {
            **u.__dict__,
            "role_name": r
        }
        for u, r in pagination.items
    ]

    roles = Role.query.all()

    return render_template(
        "users/index.html",
        users=users,
        roles=roles,
        pagination=pagination,
        role_filter=role_filter,
        name_filter=name_filter,
        email_filter=email_filter
    )

def create():
    roles = Role.query.all()
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        password = request.form['password']
        role_id = request.form.get('role_id')

        user = User(name=name, email=email, password=password, role_id=role_id)
        db.session.add(user)
        db.session.commit()
        flash('User created successfully!', 'success')
        return redirect(url_for('user_web.index'))
    return render_template('users/create.html', roles=roles)


def edit(user_id):
    user = User.query.get_or_404(user_id)
    roles = Role.query.all()
    if request.method == 'POST':
        user.name = request.form['name']
        user.email = request.form['email']
        user.password = request.form['password']
        user.role_id = request.form.get('role_id')
        db.session.commit()
        flash('User updated successfully!', 'success')
        return redirect(url_for('user_web.index'))
    return render_template('users/edit.html', user=user, roles=roles)


def delete(user_id):
    user = User.query.get_or_404(user_id)
    db.session.delete(user)
    db.session.commit()
    flash('User deleted successfully!', 'success')
    return redirect(url_for('user_web.index'))
