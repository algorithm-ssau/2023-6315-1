import pymysql
import re
from flask import app, Flask, jsonify
from flask_cors import CORS
from flaskext.mysql import MySQL
from datetime import datetime


app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False
cors = CORS(app, origins=["http://localhost:63342", "http://127.0.0.1:5500", "http://localhost:5000"])

mysql = MySQL()
# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'SSME6315-020302D'
app.config['MYSQL_DATABASE_DB'] = 'motorcycleshop'
app.config['MYSQL_DATABASE_HOST'] = 'db'
mysql.init_app(app)


@app.route("/customer/", methods=['GET'])
def customer():
    select_query = f"SELECT * FROM motorcycleshop.customer"
    conn = mysql.connect()
    cursor = conn.cursor()
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
    try:
        TestName(name)
        TestAddress(address)
        TestPhone(phone)
    except:
        return "500"
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
    if res != '()':
        return f'{res}'
    else:
        return '500'


@app.route("/product/", methods=['GET'])
def product():
    select_query = f"SELECT idproduct, name_of_type AS product_type, product_price, product_brand," \
                   f" product_model, product_action, product_power, product_count, product_image, product_date FROM product JOIN type_of_product" \
                   f" ON idtype_of_product = type_of_product_idtype_of_product;"
    cursor = mysql.get_db().cursor()
    cursor.execute(select_query)
    res = cursor.fetchall()
    jsonobj = dict()
    for row in res:
        jsonobj1 = {
            row[0]: {
                "type": row[1],
                "price": row[2],
                "brand": row[3],
                "model": row[4],
                "action": row[5],
                "power": row[6],
                "count": row[7],
                "image": row[8],
                "date": row[9]
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
'''
        try:
            TestID(idproduct)
            TestID(idcustomer)
            TestID(iddelivery)
            TestComment(comment)
            TestTime(date)
        except Exception as e:
'''

@app.route("/order_add/<idproduct>&<idcustomer>&<iddelivery>&<comment>&<date>", methods=['GET'])
def order_add(idproduct, idcustomer, iddelivery, comment, date):
    try:
        TestID(idproduct)
        TestID(idcustomer)
        TestID(iddelivery)
        TestComment(comment)
        TestTime(date)
    except:
        return '500'
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
        print("Problem selecting into db: " + str(e))
        insert_query = f"INSERT INTO motorcycleshop.order (product_idproduct, customer_idcustomer, delivery_iddelivery," \
                       f" order_comment, order_date, idorder) VALUES ('{idproduct}', '{idcustomer}', '{id_res[0][0]}'," \
                       f" '{comment}', '{date}', 0);"

        try:
            cursor.execute(insert_query)
            con.commit()
            return '200'
        except Exception as e:
            print("Problem inserting into db: " + str(e))
            return '500'
    else:
        return '500'


@app.route("/order/<idcustomer>", methods=['GET'])
def order(idcustomer):
    select_query = f"SELECT idorder, product_brand, product_model, delivery_name, order_comment, order_date " \
                   f"FROM product JOIN motorcycleshop.order ON idproduct = product_idproduct " \
                   f"JOIN delivery ON delivery_iddelivery = iddelivery " \
                   f"WHERE customer_idcustomer = '{idcustomer}';"
    cursor = mysql.get_db().cursor()
    cursor.execute(select_query)
    res = cursor.fetchall()
    jsonobj = dict()
    for row in res:
        jsonobj1 = {
            row[0]: {
                "brand": row[1],
                "model": row[2],
                "delivery_name": row[3],
                "comment": row[4],
                "date": row[5],
            }
        }
        jsonobj.update(jsonobj1)
    return jsonify(jsonobj)


def TestPhone(number):
    '''
    Проверка номера телефона
    '''
    number = str(number)
    if re.match("^8\(\d{3}\)\d{3}-\d{2}-\d{2}$", number):
        pass
    else:
        print("Телефон не соответствует формату")
        raise Exception("Телефон не соответствует формату")


def TestComment(comment):
    '''
    Проверка коммента
    '''
    if len(comment) <= 45:
        pass
    else:
        print("Превышение длины комментария")
        raise Exception("Превышение длины комментария")
    

def TestID(id):
    '''
    Проверка любого id
    '''
    if str(id).isdigit() != False:
        print("В id могут быть только цифры")
        raise Exception("В id могут быть только цифры")

def TestName(name):
    '''
    Проверка имени
    '''
    name = str(name)
    if name == "NULL":
        pass
    if len(name) > 0 and len(name) <= 45:
        name = str(name).split(" ")
        if len(name) == 2 or len(name) == 3:
            for i in name:
                if i.isalpha() == False:
                    print("Имя может состоять только из букв")
                    raise Exception("Имя может состоять только из букв")
        else:
            print("Имя может состоять только из 2 слов или 3 слов")
            raise Exception("Имя может состоять только из 2 слов или 3 слов")
    else:
        print("Имя не соответствует длине")
        raise Exception("Имя не соответствует длине")
    
def TestAddress(address):
    '''
    Проверка адреса на длину
    '''
    if len(address) <= 45:
        pass
    else:
        print("Превышение длины адреса")
        raise Exception("Превышение длины адреса")
    
    
def TestTime(date):
    '''
    Проверка времени на соответствие формату
    '''
    date = str(date)
    datetime.strptime(date, '%Y-%m-%d %H:%M:%S')
    print("Время подходит формату")

def serverflaskstart():
    app.run(debug=True, host='0.0.0.0')


if __name__ == '__main__':
    serverflaskstart()
