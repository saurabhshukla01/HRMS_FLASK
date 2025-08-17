import uuid
import sys
from werkzeug.security import generate_password_hash
from flask.cli import with_appcontext
import click
from app import db
from app.models.user_model import User
from app.models.role_model import Role

@click.command("seed-users")
@click.option("--count", default=100, help="Number of users to seed")
@with_appcontext
def seed_users(count):
    role = Role.query.filter_by(name="Employee").first()
    if not role:
        print("Employee role not found. Please seed roles first.")
        sys.exit(1)

    users = []
    for i in range(count):
        email = f"user_{uuid.uuid4().hex[:8]}@example.com"
        users.append(User(
            uuid=str(uuid.uuid4()),
            name=f"Auto User {i+1}",
            email=email,
            password=generate_password_hash("password123"),
            role_id=role.id
        ))

    db.session.add_all(users)
    db.session.commit()
    print(f"Successfully created {len(users)} users.")
