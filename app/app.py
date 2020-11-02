'''
Importing Libraries
'''
from flask import(
    Flask, 
    redirect,
    render_template, 
    request,
    session,
    url_for
) 
import random

app = Flask(__name__)

'''
Defining our routes
'''
@app.route('/')
def index():
    number = str(random.randrange(1,1000000))
    return render_template("index.html", number = number)

@app.route('/login')
def login():
    number = str(random.randrange(1,1000000))
    return render_template("login.html", number = number)

@app.route('/logout')
def logout():
    return redirect(url_for('login'))

@app.route('/user/tasks')
def tasks():
    return render_template("tasks.html")

@app.route('/admin/')
def admin_home():
    number = str(random.randrange(1,1000000))
    return render_template("admin_home.html", number = number)

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
    app.run('0.0.0.0', debug = True)