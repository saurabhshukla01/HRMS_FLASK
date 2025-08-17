from flask import Flask, render_template , request
from flask_mysqldb import MySQL
from MySQLdb.cursors import DictCursor
from helpers import paginate_query, format_datetime_custom

app = Flask(__name__)
app.secret_key = 'supersecretkey'

# MySQL Configuration
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_PORT'] = 3307
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '1234'
app.config['MYSQL_DB'] = 'flask_hrms_database'

mysql = MySQL(app)

# Routes
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/users')
def users():
    cur = mysql.connection.cursor(DictCursor)

    # Get filters from query params
    role_filter = request.args.get('role', type=int)
    name_filter = request.args.get('name', '').strip()
    email_filter = request.args.get('email', '').strip()

    page = request.args.get('page', 1, type=int)
    per_page = 10

    # Base query
    base_query = """
        FROM users u
        LEFT JOIN roles r ON u.role_id = r.id
        WHERE u.deleted_at IS NULL
    """

    filters = []
    params = []

    if role_filter:
        filters.append("u.role_id = %s")
        params.append(role_filter)
    if name_filter:
        filters.append("u.name LIKE %s")
        params.append(f"%{name_filter}%")
    if email_filter:
        filters.append("u.email LIKE %s")
        params.append(f"%{email_filter}%")

    if filters:
        base_query += " AND " + " AND ".join(filters)

    count_query = "SELECT COUNT(*) AS total " + base_query
    select_query = f"""
        SELECT u.id, u.uuid, u.name, u.email, u.role_id, r.name AS role_name,
               u.created_by, u.updated_by, u.deleted_by,
               u.created_at, u.updated_at, u.deleted_at
        {base_query}
        ORDER BY u.id ASC
    """

    users, page, total_pages = paginate_query(cur, select_query, count_query, params=params, page=page, per_page=per_page)

    # Load roles for filter dropdown
    cur.execute("SELECT id, name FROM roles ORDER BY name")
    roles = cur.fetchall()

    return render_template(
        'users/index.html',
        users=users,
        roles=roles,
        page=page,
        total_pages=total_pages,
        per_page=per_page,
        role_filter=role_filter,
        name_filter=name_filter,
        email_filter=email_filter
    )


@app.route('/roles')
def roles():
    cur = mysql.connection.cursor(DictCursor)

    # Filter
    role_name_filter = request.args.get('role_name', '', type=str).strip()

    # Pagination
    page = request.args.get('page', 1, type=int)
    per_page = 10

    # Base query
    base_query = "FROM roles WHERE deleted_at IS NULL"
    filters = []
    params = []

    if role_name_filter:
        filters.append("name LIKE %s")
        params.append(f"%{role_name_filter}%")

    if filters:
        base_query += " AND " + " AND ".join(filters)

    count_query = "SELECT COUNT(*) AS total " + base_query
    select_query = f"""
        SELECT id, uuid, name, created_by, updated_by, deleted_by,
               created_at, updated_at, deleted_at
        {base_query}
        ORDER BY id ASC
    """

    roles, page, total_pages = paginate_query(cur, select_query, count_query, params=params, page=page, per_page=per_page)

    return render_template(
        'roles/index.html',
        roles=roles,
        page=page,
        total_pages=total_pages,
        role_name_filter=role_name_filter,
        per_page=per_page
    )


@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/forgot-password')
def forgot_password():
    return render_template('forgot-password.html')

@app.route('/tables')
def tables():
    return render_template('tables.html')

# Custom 404 Error Page
@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

# add helpers as well for format_datetime_custom & Pagniation
app.jinja_env.filters['custom_datetime'] = format_datetime_custom

# Run the app
if __name__ == "__main__":
    app.run(debug=True)
