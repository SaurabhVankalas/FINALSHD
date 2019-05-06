from flask import request,url_for,json,jsonify
from mysql.connector import Error
import os,sys

import db_conf as con
import datetime as dt,time as tm

db = con.db
cursor=db.cursor()

now = dt.datetime.now()
dtd = now.strftime('%Y')

import insertdata as ins
import updatedata as up


#This function will insert a new record in table "patient_registration" for new patient.
def newSample():
    #regno = request.form['regno']
    #pclass= request.form['pclass']
    dbcolumn = []
    htmlcolumn = []
    tablename = "add_sample"
    result=''
    try:
        if request.method == 'POST':
            dbcolumn.append('test_type')
            dbcolumn.append('test_name')
            dbcolumn.append('Male_Range')
            dbcolumn.append('Female_Range')
            dbcolumn.append('Unit')

            htmlcolumn.append(request.form['test_type'])
            htmlcolumn.append(request.form['test_name'])
            htmlcolumn.append(request.form['Male_Range'])
            htmlcolumn.append(request.form['Female_Range'])
            htmlcolumn.append(request.form['Unit'])
            # Here we are calling InsertData that have a  common  code for insert record.
            result = ins.InsertData(dbcolumn,htmlcolumn,tablename)
            return result
    except Exception as e:
        return str(e)


