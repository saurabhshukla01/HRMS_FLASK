from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = 'supersecretkey'

# MySQL Configuration
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_PORT'] = 3307
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '1234'
app.config['MYSQL_DB'] = 'flask_hrms_database'

mysql = MySQL(app)

@app.route('/')
def index():
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT DATABASE();")
        db_name = cur.fetchone()
        return f"✅ Connected to DB: {db_name[0]}"
    except Exception as e:
        return f"❌ Database connection failed: {e}"

if __name__ == "__main__":
    app.run(debug=True)
