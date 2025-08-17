from flask import Blueprint, render_template

main_web = Blueprint('main_web', __name__)

# Routes
@main_web.route('/')
def index():
    return render_template('index.html')

@main_web.route('/tables')
def tables():
    return render_template('tables.html')


