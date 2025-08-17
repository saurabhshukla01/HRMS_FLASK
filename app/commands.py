import click
import uuid
from werkzeug.security import generate_password_hash
from app import db
from app.models.role_model import Role
from app.models.user_model import User

def register_commands(app):
    @app.cli.command("seed-data")
    def seed_data():
        """Seed initial roles and admin user."""
        with app.app_context():
            # Seed roles
            default_roles = ["Admin", "Manager", "Employee"]
            for role_name in default_roles:
                if not Role.query.filter_by(name=role_name).first():
                    new_role = Role(uuid=str(uuid.uuid4()), name=role_name)
                    db.session.add(new_role)
                    click.echo(f"Added role: {role_name}")

            # Seed admin user
            admin_email = "admin@example.com"
            if not User.query.filter_by(email=admin_email).first():
                admin_role = Role.query.filter_by(name="Admin").first()
                admin_user = User(
                    uuid=str(uuid.uuid4()),
                    name="System Admin",
                    email=admin_email,
                    role_id=admin_role.id,
                    password=generate_password_hash("admin123")
                )
                db.session.add(admin_user)
                click.echo(f"Added admin user: {admin_email}")

            db.session.commit()
            click.echo("Seeding complete!")
