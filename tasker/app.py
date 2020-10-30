from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/login')
def login():
    return render_template("login.html")

@app.route('/user/tasks')
def tasks():
    return render_template("tasks.html")

@app.route('/admin/')
def admin_home():
    return render_template("admin_home.html")

@app.route('/admin/employees')
def admin_employees():
    return render_template("admin_employees.html")

@app.route('/admin/branches')
def admin_brnaches():
    return render_template("admin_branches.html")

@app.route('/admin/tasks')
def admin_tasks():
    return render_template("admin_tasks.html")

if __name__ == "__main__":
    app.run('0.0.0.0')