from flask import Flask,render_template,request,send_from_directory,session,redirect,url_for,json,jsonify
import mysql.connector
from mysql.connector import Error
import os,sys
newpath = os.getcwd()+"/dbpy"
sys.path.insert(0, newpath)

newpath = os.getcwd()+"/pyfiles"
sys.path.insert(0, newpath)

newpath = os.getcwd()+"/pyfiles/REGISTRATION"
sys.path.insert(0, newpath)
newpath = os.getcwd()+"/pyfiles/outpatient"
sys.path.insert(0, newpath)
newpath = os.getcwd()+"/pyfiles/inpatient"
sys.path.insert(0, newpath)
newpath = os.getcwd()+"/pyfiles/Helper"
sys.path.insert(0, newpath)
newpath = os.getcwd()+"/pyfiles/admin"
sys.path.insert(0, newpath)
newpath = os.getcwd()+"/pyfiles/lab"
sys.path.insert(0, newpath)





import registration as reg
import outvisit as opd
import ipd as ipd
import adminstuff as adm
import myHelper as hm,db_conf as con
import lab as lab


app=Flask(__name__)
#access to database connection
db=con.db
#prepare cursor object using cursor() method
cursor=db.cursor()

app.config['SECRET_KEY'] = 'my details secret!'
app.config['UPLOAD_FOLDER_OPD']=app.root_path+'/uploads/'
app.config['DLOAD_FOLDER']=app.root_path+'/uploads/'

@app.route('/uploads/<filename>',methods=['GET'])
def view_attachment(filename):
	return send_from_directory(app.config['UPLOAD_FOLDER_OPD'],filename)

@app.route('/excel/<filename>',methods=['GET'])
def view_attachment2(filename):
	return send_from_directory(app.config['DLOAD_FOLDER'],filename)

    #default route
    #This method redirects to homepage of corresponding usertype if user is already logged in, else render 'login.html' page.
    #This may also get a error code.

@app.route('/',methods=['GET'])
def login():
	errorcode=request.args.get('error')
	page='login/login.html'
	if session.get('logged_in')==True:
		page=hm.getUserHomePage(session)
	return render_template(page,error=errorcode,alerMsg="You Already Loged in",pa='pas')

@app.route('/home', methods=['GET','POST'])
def home():
	if session.get('logged_in')==True:
		alerMsg="You Already Loged in"
		page=hm.getUserHomePage(session)
		return render_template(page,alerMsg=alerMsg,pa='pas',msg1=' ',msg='main' )

	if request.method=='POST':
		username=request.form['username']
		password=request.form['password']
		location=request.form['location']
		try:
			sql = "SELECT eid from users where username='{}' and password='{}'".format(username,password)
			cursor.execute(sql)
			data=cursor.fetchone()[0]
			if(cursor.rowcount=='None'):
				return redirect(url_for('login',error='1'))
			else:
				sql = "select ename,emptype from employee where eid='{}'".format(data)
				print(sql)
				cursor.execute(sql)
				edata = cursor.fetchone()

				session['logged_in']=True
				session['name'] = str(edata[0]).upper()
				session['usertype'] = str(edata[1]).upper()
				session['location'] = location.upper()
				page=hm.getUserHomePage(session)
				msg1=' '
				usr=edata[0]
				return render_template(page,msg1=msg1,usr=usr,pa='test',msg='main')
		except Error as e:
			print(e)
			return redirect(url_for('login',error='2'))
	return 	redirect(url_for('login'))

@app.route('/logout')
def logout():
	#unsetting session variables
	session.pop('name',None)
	session.pop('username',None)
	session.pop('usertype',None)
	session.pop('logged_in',None)
	return render_template('login/login.html',error='3')

##--------------GENERAL CODE-------------------



##--------------NEW PATIENT REGISTRATION NPR_START -----------------------

@app.route('/AJXgetRegno',methods=['GET','POST'])
def AJXgetRegno():
	return json.dumps({'regno' : reg.getNewRegno()});

@app.route('/newpatient_Redir',methods=['GET','POST'])
def newpatient_Redir():
	regno=reg.getNewRegno() #FileName = pyfile/REGISTRATION/registration.py
	disname=adm.getAllDistrict() #FileName = pyfile/admin/adminstuff.py
	return render_template('/registration/patient_reg.html',regno=regno,disname = disname)

@app.route('/Insertnewpatient',methods=['GET','POST'])
def Insertnewpatient():
	result = reg.newRegistration() #FileName = pyfile/REGISTRATION/registration.py
	regno = request.form['regno']
	tablename = "patient_registration"
	if result==1:
		return redirect(url_for('blank_Insertnewpatient',regno=regno,tbname=tablename))
	else:
		return render_template('/registration/patient_reg.html',ack=result)

@app.route('/blank_Insertnewpatient',methods=['GET','POST'])
def blank_Insertnewpatient():
	regno = request.args['regno']
	tablename = request.args['tbname']
	dataset = reg.getPatient_Registration_All(regno) #FileName = pyfile/REGISTRATION/registration.py
	return render_template('/opdvisit/opdvisit.html',data=dataset,ptype="NEW")

##--------------NEW PATIENT REGISTRATION NPR_END -----------------------

##-------------NEW PATIENT UPDATION NPU_START---------------------------
@app.route('/updatepatient_Redir',methods=['GET','POST'])
def updatepatient_Redir():
	return render_template('/registration/patientUpdate.html',ds='')

@app.route('/getUpdatePatient',methods=['GET','POST'])
def getUpdatePatient():
	regno = request.form['regno']
	dataset = reg.getPatient_Registration_All(regno)  #FileName = pyfile/REGISTRATION/registration.py
	disname=adm.getAllDistrict() #FileName = pyfile/admin/adminstuff.py
	if len(dataset) > 0:
		return render_template('/registration/update_patient_reg.html',ds=dataset,disname=disname)
	else:
		return render_template('/registration/patientUpdate.html',ack="NO DATA FOUND")

@app.route('/UpdatePatientRecord',methods=['GET','POST'])
def UpdatePatientRecord():
	result = reg.updateRegistration() #FileName = pyfile/REGISTRATION/registration.py
	if result==1:
		return render_template('/registration/update_patient_reg.html',ack="DATA UPDATED SUCCESSFULLY!")
	else:
		return render_template('/registration/update_patient_reg.html',ack=result)

##-------------NEW PATIENT UPDATION NPU_END---------------------------


##--------------OLD PATIENT VISIT OPV_START ----------------------------

@app.route('/oldpatient_Redir',methods=['GET','POST'])
def oldpatient_Redir():
	return render_template('/registration/oldpatient.html')

@app.route('/oldpatientregno',methods=['GET','POST'])
def oldpatientregno():
	dataset = opd.getOldPatientRegno() #FileName=/pyfile/opdvisit/outvisit.py
	return render_template('/registration/oldpatient.html',ds=dataset)

@app.route('/oldpatientfname',methods=['GET','POST'])
def oldpatientfname():
	dataset = opd.getOldPatientFName() #FileName=/pyfile/opdvisit/outvisit.py
	return render_template('/registration/oldpatient.html',ds=dataset)

@app.route('/oldpatientcontact',methods=['GET','POST'])
def oldpatientcontact():
	dataset = opd.getOldPatientContact() #FileName=/pyfile/opdvisit/outvisit.py
	return render_template('/registration/oldpatient.html',ds=dataset)

@app.route('/oldpatientaadhar',methods=['GET','POST'])
def oldpatient():
	dataset = opd.getOldPatientAadhar() #FileName=/pyfile/opdvisit/outvisit.py
	return render_template('/registration/oldpatient.html',ds=dataset)

@app.route('/oldpatientaddress',methods=['GET','POST'])
def oldpatientaddress():
	dataset = opd.getOldPatientAddress() #FileName=/pyfile/opdvisit/outvisit.py
	return render_template('/registration/oldpatient.html',ds=dataset)

##--------------OLD PATIENT VISIT OPV_END ----------------------------

##-------------PATIENT VITAL PVIT_START-------------------------------
@app.route('/opdVisit_redir',methods=['GET','POST'])
def opdVisit_redir():
	regno =request.form['regno']
	dataset = reg.getPatient_Registration_All(regno) #FileName = pyfile/REGISTRATION/registration.py
	return render_template('/opdvisit/opdvisit.html',data=dataset,ptype="OLD")

@app.route('/opdVisit',methods=['GET','POST'])
def opdVisit():
	result = opd.visitOpdInsert() #FileName=/pyfile/opdvisit/outvisit.py
	regno = request.form['regno']
	vdate = request.form['vdate']
	if result==1:
		return redirect(url_for('blank_opdVisit',regno=regno,vd=vdate))
	else:
		return render_template('/opdvisit/opdvisit.html',ack=result)

@app.route('/blank_opdVisit',methods=['GET','POST'])
def blank_opdVisit():
	regno = request.args['regno']
	vdate = request.args['vd']
	return render_template('/opdvisit/opdvisit.html',ack="DATA STORED SUCCESSFULLY!",regno=regno,vd=vdate)

##-------------PATIENT VITAL PVIT_END--------------------------------

##-------------OLD PATIENT VISIT UPDATE START OPVU_START--------------

@app.route('/opdViewUpdate_Redir',methods=['GET','POST'])
def opdViewUpdate_Redir():
	return render_template('/opdvisit/opdView_Update_Redir.html',ds1='',ds2='')

# This function will serve two module first is opdView_Update_Redir and second is opdConsultViewUpdate_Redir.
#It will identify the module on the basis of psource variable value.
@app.route('/getOpdViewUpdate',methods=['GET','POST'])
def getOpdViewUpdate():
	regno=request.form['regno']
	psource =request.form['source']
	dataset1 = reg.getPatient_Registration_All(regno) #FileName = pyfile/REGISTRATION/registration.py
	if len(dataset1)>0:
		dataset2 = opd.getPatientVisitData(regno) #FileName=/pyfile/opdvisit/outvisit.py
		if len(dataset1)>0 and len(dataset2)>0:
			if psource == 'opdviewupdate':
				return render_template('/opdvisit/opdView_Update_Redir.html',ds1=dataset1,ds2=dataset2)
			elif psource == 'opdconsultviewupdate':
				return render_template('/opdvisit/opdconsultViewUpdate_Redir.html',ds1=dataset1,ds2=dataset2)
		else:
			if psource == 'opdviewupdate':
				return render_template('/opdvisit/opdView_Update_Redir.html',ds1=dataset1,ds2='',ack2="NO VISIT IS RECORDED YET!")
			elif psource == 'opdconsultviewupdate':
				return render_template('/opdvisit/opdconsultViewUpdate_Redir.html',ds1=dataset1,ds2='',ack2="NO VISIT IS RECORDED YET!")
	else:
		return render_template('/opdvisit/opdView_Update_Redir.html',ds1='',ack1="INVALID REGNO!")

@app.route('/OpdViewUpdateShow',methods=['GET','POST'])
def OpdViewUpdateShow():
	opdid = request.form['opdid']
	regno = request.form['regno']
	print(request.form['regno'],request.form['opdid'])
	dataset1 = reg.getPatient_Registration_All(regno) #FileName = pyfile/REGISTRATION/registration.py
	dataset2 = opd.getAllPatientVisitData(opdid) #FileName=/pyfile/opdvisit/outvisit.py
	return render_template('/opdvisit/opdView_Update.html',data1=dataset1,data2=dataset2)

@app.route('/OpdViewUpdate',methods=['GET','POST'])
def OpdViewUpdate():
	result = opd.opdVisitUpdate() #FileName=/pyfile/opdvisit/outvisit.py
	if result==1:
		return render_template('/opdvisit/opdView_Update.html',ack="DATA UPDATED SUCCESSFULLY!",regno=request.form['regno'])
	else:
		return render_template('/opdvisit/opdView_Update.html',ack=result)



##-------------OLD PATIENT VISIT UPDATE START OPVU_END------------------

##-------------OLD PATIENT VISIT ACKNOWLEDGE START OPVACK_START---------

@app.route('/opdAcknowledgement_Redir',methods=['GET','POST'])
def opdAcknowledgement_Redir():
	return render_template('/opdvisit/opdAcknowledge.html')

##-------------OLD PATIENT VISIT ACKNOWLEDGE START OPVACK_START---------

##-------------OLD PATIENT VISIT REPORT START OPVR_START----------------

@app.route('/opdReport_Redir',methods=['GET','POST'])
def opdReport_Redir():
	return render_template('/opdvisit/opdReport.html')

##-------------OLD PATIENT VISIT REPORT START OPVR_END-----------------

##-------------PATIENT CONSULT START OPC_START-----------------

@app.route('/opdConsult_Redir',methods=['GET','POST'])
def opdConsult_Redir():
	return render_template('/opdvisit/opdconsult_Redir.html',ack1='',ack2='')

@app.route('/getOpdConsult',methods=['GET','POST'])
def getOpdConsult():
	regno=request.form['regno']
	todaydate=request.form['tdate']
	dataset1 = reg.getPatient_Registration_All(regno) #FileName = pyfile/REGISTRATION/registration.py
	if len(dataset1)>0:
		dataset2 = opd.getTodayPatientVisitData(regno,todaydate) #FileName=/pyfile/opdvisit/outvisit.py
		if len(dataset1)>0 and len(dataset2)>0:
			return render_template('/opdvisit/opdconsult.html',ds1=dataset1,ds2=dataset2,ack1='',ack2='',vital='ON',his='',ref='',med='',dia='',up='')
		else:
			return render_template('/opdvisit/opdconsult_Redir.html',ack1="NO VISIT IS RECORDED FOR TODAY YET!")
	else:
		return render_template('/opdvisit/opdconsult_Redir.html',ack2="INVALID REGNO!")

##-------------PATIENT REFER START OPDR_START---------------

@app.route('/opdConsultRefer',methods=['GET','POST'])
def opdConsultRefer():
	result = opd.insertOpdConsultRefer() #FileName=/pyfile/opdvisit/outvisit.py
	if result == 1:
		return jsonify({"ack":"DATA SUCCESSFULLY STORED!"})
	else:
		return jsonify({"ack":result})

##-------------PATIENT REFER START OPDR_END---------------


##-------------PATIENT HISTORY START OPDH_START---------------
@app.route('/opdConsultHistory',methods=['GET','POST'])
def opdConsultHistory():
	result = opd.insertOpdConsultHistory() #FileName=/pyfile/opdvisit/outvisit.py
	if result == 1:
		return jsonify({"ack":"DATA SUCCESSFULLY STORED!"})
	else:
		return jsonify({"ack":result})

##-------------PATIENT HISTORY START OPDH_END---------------

##-------------PATIENT DIAGNOSIS START OPD_START---------------
@app.route('/getOpdDiagnosis',methods=['GET','POSt'])
def getOpdDiagnosis():
	dataset = opd.getDiagnosis() #FileName=/pyfile/opdvisit/outvisit.py
	if dataset != 0:
		return jsonify(dataset)
	else:
		return jsonify(dataset)

@app.route('/opdDiagnosis',methods=['GET','POST'])
def opdDiagnosis():
	result=opd.insertOpdDiagnosis()#FileName=/pyfile/opdvisit/outvisit.py
	if result == 1:
		return jsonify({"ack":"DATA SUCCESSFULLY STORED!"})
	else:
		return jsonify({"ack":result})

##-------------PATIENT DIAGNOSIS START OPD_END---------------

##-------------PATIENT DOCUMENTS UPLOAD START OPDDOCUP_START---------------

@app.route('/opdUpDoc_Redir',methods=['GET','POSt'])
def opdUpDoc_Redir():
	return render_template('/opdvisit/opduploaddoc_Redir.html')

@app.route('/getOpdDocUp',methods=['GET','POST'])
def getOpdDocUp():
	regno=request.form['regno']
	dataset = reg.getPatient_Registration_All(regno) #FileName = pyfile/REGISTRATION/registration.py
	if len(dataset)>0:
		return render_template('/opdvisit/opdUpload.html',ds=dataset)
	else:
		return render_template('/opdvisit/opduploaddoc_Redir.html',ack="INVALID REGNO!")

@app.route('/opdDocUpload',methods=['GET','POST'])
def opdDocUpload():
	print(request.form['regno'],request.form['entrydate'])
	result=opd.insertOpdDocUpload(app.config['UPLOAD_FOLDER_OPD'])#FileName=/pyfile/opdvisit/outvisit.py
	if result==1:
		return redirect(url_for('blank_opdDocUpload'))
	else:
		return render_template('/opdvisit/opdUpload.html',ack=result)

@app.route('/blank_opdDocUpload',methods=['GET','POST'])
def blank_opdDocUpload():
	return render_template('/opdvisit/opdUpload.html',ack="DOCUMENT(S) UPLOADED SUCCESSFULLY!")

##-------------PATIENT DOCUMENTS UPLOAD END OPDDOCUP_END---------------

##-------------PATIENT CONSULT START OPC_END-----------------------------


##--------------PATIENT CONSULT UPDATION STARTOPCU_START-----------------

@app.route('/opdConsultViewUpdate_Redir',methods=['GET','POST'])
def opdConsultViewUpdate_Redir():
	return render_template('/opdvisit/opdconsultViewUpdate_Redir.html',ds1='',ds2='')


@app.route('/getOpdConsultData',methods=['GET','POST'])
def getOpdConsultData():
	regno=request.form['regno']
	opdid=request.form['opdid']
	dataset1 = reg.getPatient_Registration_All(regno) #FileName = pyfile/REGISTRATION/registration.py
	hisdataset = opd.getOpdConsultHistory(opdid) #FileName=/pyfile/opdvisit/outvisit.py
	refdataset = opd.getOpdConsultRefer(opdid) #FileName=/pyfile/opdvisit/outvisit.py
	diadataset = opd.getOpdConsultDiagnosis(opdid) #FileName=/pyfile/opdvisit/outvisit.py
	if len(dataset1)>0:
		return render_template('/opdvisit/opdconsultViewUpdate.html',ds1=dataset1,hds=hisdataset,rds=refdataset,dds=diadataset)
	else:
		return render_template('/opdvisit/opdconsultViewUpdate.html',ack="No Record Found For Given Regno!")





##--------------PATIENT CONSULT UPDATION END OPCU_END-----------------



##--------------ADMIT PATIENT START AP_START-----------------

@app.route('/admit_Redir',methods=['GET','POST'])
def admit_Redir():
	return render_template('/ipdvisit/admit.html')

@app.route('/admitPatient',methods=['GET','POST'])
def admitPatient():
	regno =request.form['regno']
	dataset = ipd.getLatestAdmitPatientData(regno) #FileName=/pyfile/inpatient/ipd.py.
	wardname = adm.getAllWard() ##FileName = pyfile/admin/adminstuff.py
	return render_template('/ipdvisit/ipdvisit.html',ds=dataset,wname=wardname)

@app.route('/ipdvisit',methods=['GET','POST'])
def ipdvisit():
	regno=request.form['regno']
	ipddate=request.form['ipddate']
	result = ipd.visitIpd() #FileName=/pyfile/inpatient/ipd.py.
	if result==1:
		return redirect(url_for('blank_ipdvisit',regno=regno,vd=ipddate))
	else:
		return render_template('/ipdvisit/ipdvisit.html',ack=result)

@app.route('/blank_ipdvisit',methods=['GET','POST'])
def blank_ipdvisit():
	regno = request.args['regno']
	vdate = request.args['vd']
	return render_template('/ipdvisit/ipdvisit.html',ack="DATA STORED SUCCESSFULLY!",regno=regno,vd=vdate)

@app.route('/ipdViewUpdate_Redir',methods=['GET','POST'])
def ipdViewUpdate_Redir():
	return render_template('/ipdvisit/ipdView_Update_Redir.html',ds1='',ds2='')

@app.route('/getIpdViewUpdate',methods=['GET','POST'])
def getIpdViewUpdate():
	regno = request.form['regno']
	dataset1 = reg.getPatient_Registration_All(regno) #FileName = pyfile/REGISTRATION/registration.py
	if len(dataset1)>0:
		dataset2 = ipd.getAllAdmitPatientData(regno)#FileName=/pyfile/inpatient/ipd.py.
		if len(dataset1)>0 and len(dataset2)>0:
			return render_template('/ipdvisit/ipdView_Update_Redir.html',ds1=dataset1,ds2=dataset2)
		else:
			return render_template('/ipdvisit/ipdView_Update_Redir.html',ds1=dataset1,ds2='',ack2="NO VISIT IS RECORDED YET!")
	else:
		return render_template('/ipdvisit/ipdView_Update_Redir.html',ds1='',ack1="INVALID REGNO!")


@app.route('/IpdViewUpdateShow',methods=['GET','POST'])
def IpdViewUpdateShow():
	ipdid = request.form['ipdid']
	regno = request.form['regno']
	dataset1 = reg.getPatient_Registration_All(regno) #FileName = pyfile/REGISTRATION/registration.py
	dataset2 = ipd.getAdmitPatientData(ipdid) #FileName=/pyfile/inpatient/ipd.py.
	wardname = adm.getAllWard() ##FileName = pyfile/admin/adminstuff.py
	return render_template('/ipdvisit/ipdView_Update.html',data1=dataset1,data2=dataset2,wname=wardname)

@app.route('/IpdViewUpdate',methods=['GET','POST'])
def IpdViewUpdate():
		result = ipd.visitIpdUpdate() #FileName=/pyfile/inpatient/ipd.py.

		if result==1:
			return render_template('/ipdvisit/ipdView_Update.html',ack="DATA UPDATED SUCCESSFULLY!",regno=request.form['regno'])
		else:
			return render_template('/ipdvisit/ipdView_Update.html',ack=result)

##--------------ADMIT PATIENT END AP_END-----------------

##--------------LAB--------------------------------------

@app.route('/Insertnewsample',methods=['GET','POST'])
def Insertnewsample():
	result = lab.newSample() #FileName = pyfile/lab/lab.py
	tablename = "add_sample"
	if result==1:
		return render_template('/lab/lab_main.html')
	else:
		return render_template('/lab/add_sample.html',ack=result)




if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5120,debug=True)
