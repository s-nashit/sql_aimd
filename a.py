import mysql.connector
import streamlit as st

conn = mysql.connector.connect(
    host="localhost", 
    user="root", 
    password="nashit",
    database = "python")
# print(mydb)
# st.write(mydb)
cur = conn.cursor()
# cur.execute('create table emp(id int not null auto_increment primary key,name text,age int)')
# cur.execute("show tables")
# st.write('created successfully')
# for i in cur:
#     # print(i)
#     st.write(i)
# a = st.text_input("enter name")
# b = st.text_input("enter age")
# print(a)
# st.write(a)

with st.form("insert_data"):
    name = st.text_input("Name")
    age = st.text_input("Age")
    submit_button = st.form_submit_button("Insert Data")
    display_data = st.form_submit_button("Display Data")
    update_data = st.form_submit_button("Update Data")

if submit_button:
    query = "INSERT INTO emp (name, age) VALUES (%s, %s)"
    cur.execute(query, (name, age))
    conn.commit()
    st.success('data witten successfully')
    st.balloons()

if display_data:
    cur.execute("select * from emp")
    for i in cur:
        st.write(i)
        # st.write(st.button('update'))


user_id = st.text_input("enter id")
new_name = st.text_input("enter name")
new_age = st.text_input("enter age")
if st.button('update'):
    query = "update emp set name = %s, age = %s where id = %s"
    cur.execute(query, (new_name, new_age, user_id))
    conn.commit()
    st.success('data updated successfully')
    st.balloons()

delete_user_id = st.text_input("enter user id")
if st.button('delete'):
    query = "delete from emp where id = %s"
    cur.execute(query, (delete_user_id,))
    conn.commit()
    st.success('data deleted successfully')
    st.balloons()