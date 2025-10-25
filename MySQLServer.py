# MySQLServer.py
import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password=''  # change if your root has a password
        )
        cursor = conn.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS `alx_book_store`")
        print("Database 'alx_book_store' created successfully!")
    except Error as e:
        print(f"Error: {e}")
    finally:
        try:
            if cursor:
                cursor.close()
            if conn:
                conn.close()
        except:
            pass

if __name__ == "__main__":
    create_database()
