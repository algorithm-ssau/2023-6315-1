from flask import app, Flask, jsonify
from flaskext.mysql import MySQL


app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False

mysql = MySQL()
# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'pythonuser'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'motorcycleshop'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route("/customer/", methods=['GET'])
def customer():
    select_query = f"SELECT * FROM motorcycleshop.customer"
    cursor = mysql.get_db().cursor()
    cursor.execute(select_query)
    res = cursor.fetchall()
    jsonobj = dict()
    for row in res:
        jsonobj1 = {
            row[0]: {
                "name": row[1],
                "address": row[2],
                "phone": row[3]
            }
        }
        jsonobj.update(jsonobj1)
    return jsonify(jsonobj)

def serverFlaskStart():
    app.run(debug=True, host='25.19.103.131')


def select_from_db(connection, table_name):
    select_query = f"SELECT * FROM motorcycleshop.{table_name}"
    with connection.cursor() as cursor:
        cursor.execute(select_query)
        result = cursor.fetchall()
    return result


if __name__ == '__main__':
    serverFlaskStart()