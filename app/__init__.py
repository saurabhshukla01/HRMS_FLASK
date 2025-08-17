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

    # Register blueprints here
    from app.routes.user_routes import user_bp
    from app.routes.role_routes import role_bp
    app.register_blueprint(user_bp)
    app.register_blueprint(role_bp)

    return app

 