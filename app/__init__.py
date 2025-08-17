from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from config import Config

db = SQLAlchemy()
migrate = Migrate()

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    db.init_app(app)
    
    # Import models here so migrations can detect them
    from app.models import user_model, role_model

    migrate.init_app(app, db)

    # Register blueprints here for api routes
    from app.routes.user_routes import user_bp
    from app.routes.role_routes import role_bp

    # Register blueprints here for web routes
    from app.routes.user_web_routes import user_web_bp
    from app.routes.role_web_routes import role_web_bp
    from app.routes.main_web_routes import main_web_bp
    from app.routes.auth_web_routes import auth_web_bp
    

    app.register_blueprint(user_bp)
    app.register_blueprint(role_bp)

    app.register_blueprint(user_web_bp)
    app.register_blueprint(role_web_bp)
    app.register_blueprint(main_web_bp)
    app.register_blueprint(auth_web_bp)

    # Register CLI commands
    from app.commands import register_commands
    register_commands(app)

    # Register CLI command
    from app.scripts.auto_create_users import seed_users
    app.cli.add_command(seed_users)

    return app

 