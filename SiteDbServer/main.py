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


@app.route("/customer_add/<name>&<address>&<phone>", methods=['GET'])
def customer_add(name, address, phone):
    insert_query = f"INSERT INTO customer (idcustomer, customer_name, customer_address, customer_phone) VALUES " \
                   f"(0, '{name}', '{address}', '{phone}');"
    select_querry = f"SELECT idcustomer FROM customer WHERE customer_name = '{name}' AND" \
                    f" customer_address = '{address}' AND customer_phone = '{phone}'"
    con = mysql.connect()
    cursor = con.cursor()
    res = ''
    try:
        cursor.execute(insert_query)
        con.commit()
    except Exception as e:
        print("Problem inserting into db: " + str(e))
    try:
        cursor.execute(select_querry)
        res = cursor.fetchall()
    except Exception as e:
        print("Problem selecting into db: " + str(e))
    if res != 'null':
        return '200' + f'{res[0][0]}'
    else:
        return '500'


@app.route("/product/", methods=['GET'])
def product():
    select_query = f"SELECT idproduct, name_of_type AS product_type, product_colour, product_price, product_brand," \
                   f" product_model, product_action, product_power, product_count FROM product JOIN type_of_product" \
                   f" ON idtype_of_product = type_of_product_idtype_of_product;"
    cursor = mysql.get_db().cursor()
    cursor.execute(select_query)
    res = cursor.fetchall()
    jsonobj = dict()
    for row in res:
        jsonobj1 = {
            row[0]: {
                "type": row[1],
                "colour": row[2],
                "price": row[3],
                "brand": row[4],
                "model": row[5],
                "action": row[6],
                "power": row[7],
                "count": row[8],
            }
        }
        jsonobj.update(jsonobj1)
    return jsonify(jsonobj)


@app.route("/delivery/", methods=['GET'])
def delivery():
    select_query = 'SELECT idtype_of_delivery, delivery_name, delivery_phone, name_of_type, type_of_delivery_price AS' \
                   ' price FROM delivery JOIN type_of_delivery ON iddelivery = delivery_iddelivery'
    cursor = mysql.get_db().cursor()
    cursor.execute(select_query)
    res = cursor.fetchall()
    jsonobj = dict()
    for row in res:
        jsonobj1 = {
            row[0]: {
                "name": row[1],
                "phone": row[2],
                "name_of_type": row[3],
                "price": row[4]
            }
        }
        jsonobj.update(jsonobj1)
    return jsonify(jsonobj)


@app.route("/order_add/<idproduct>&<idcustomer>&<iddelivery>&<comment>&<date>", methods=['GET'])
def order_add(idproduct, idcustomer, iddelivery, comment, date):
    select_querry = f"SELECT delivery_iddelivery FROM type_of_delivery WHERE idtype_of_delivery = '{iddelivery}'"
    con = mysql.connect()
    cursor = con.cursor()
    id_res = ""
    try:
        cursor.execute(select_querry)
        id_res = cursor.fetchall()
    except Exception as e:
        print("Problem selecting into db: " + str(e))
    if (id_res != ""):
        insert_query = f"INSERT INTO motorcycleshop.order (product_idproduct, customer_idcustomer, delivery_iddelivery, order_comment, order_date) VALUES " \
                   f"('{idproduct}', '{idcustomer}', '{id_res[0][0]}', '{comment}', '{date}');"

        try:
            cursor.execute(insert_query)
            con.commit()
            return '200'
        except Exception as e:
            print("Problem inserting into db: " + str(e))
            return '500'
    else:
        return '500'


def serverflaskstart():
    app.run(debug=True, host='25.19.103.131')


def select_from_db(connection, table_name):
    select_query = f"SELECT * FROM motorcycleshop.{table_name}"
    with connection.cursor() as cursor:
        cursor.execute(select_query)
        result = cursor.fetchall()
    return result


if __name__ == '__main__':
    serverflaskstart()
