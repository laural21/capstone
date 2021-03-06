# import statements
import sys, os
import time
import datetime
import threading
import cgi, cgitb
cgitb.enable()
import sys, os
import codecs
import cx_Oracle
sys.stdout = codecs.getwriter("utf-8")(sys.stdout.detach())

import parse_dfb_dfd as parser
import generate_file_list as file_list

# Authentication information for database connection
user = 'sysdba'
pw = 'oracle'
server = 'orc1'
hostname = 'j4m8888'
portnum = '1521'

##############################################################################################################################
# INPUT:    a list of data titles, a specific title
# RETURN:   the index of this specific field
def find_field_in_dfd (dfd, field_to_find):
	found_field = 9999 #not found code
	for t in range(0,len(dfd),1):
		if dfd[t] == field_to_find:
			found_field = t
			break
	return found_field

##############################################################################################################################
# INPUT:    a list of data titles
# RETURN:   the index of title "Batch Number" and "Date/Time"
def find_field_in_dfd_MSN_DATETIME(dfd):
	MSN_pos         = find_field_in_dfd (dfd, "Batch Number")
	DATETIME_pos    = find_field_in_dfd (dfd, "Date/Time")
	return MSN_pos, DATETIME_pos

##############################################################################################################################
# INPUT:    directory information
# RETURN:   nothing, but create the final .csv file in the specified directory
def create_CSV_FULL(drive,machine,module,part_type):
	dfd_fields          = []
	dfb_fields          = []
	additionnal_fields  = []

	print("Generating file for "+drive+":"+machine+"/"+module+"/"+part_type)

	DATA = []
    
	# create a list of file names (fullname) in increasing order
	dfd_filelist = file_list.retrieve_new_file(drive,machine,module,part_type)
	# print(dfd_filelist)
	for files in dfd_filelist:
		# parsing .dfd and .dfb/.dfx file and mounting them
		dfd_fields, dfb_fields, additionnal_fields, error_code, file_errors = parser.dfd_dfb_parsing(files)
		if error_code == 0 and file_errors == 0:
			# if we are here, there's no error while parsing
			MSN_position, DATETIME_position  = find_field_in_dfd_MSN_DATETIME(dfd_fields)
			if MSN_position!=9999 and DATETIME_position !=9999:
				for lines in dfb_fields:
					DATA.append(lines)
			else:
				print("1_Errors occured while parsing : ", files)
		else:
			print("2_Errors occured while parsing : ", files)
#################################################################################################
    # try:
    # # Establish connection to Oracle database
    # conn = cx_Oracle.connect(user,pw,hostname+':'+portnum+'/'+server, cx_Oracle.SYSDBA)
    # c = conn.cursor()
    
#################################################################################################
    # generating CSV file
    # before this step we should have a list called DATA containing all the data
    # the following step is trivial, not as important as the last one
	today = datetime.date.today()
	f = open("C:\\Users\\supplier_admin\\Desktop\\CSV\\"+machine+"_"+module+"_"+part_type+"_"+str(today.year)+str(today.month)+str(today.day)+".csv", "w")
	txt = ""
	for title in dfd_fields:
		# print("title: ", title)
		txt+= title
		txt+= ","
	f.write(txt+"\n")
	for row in DATA:
		# print("row: ",row)
		txt = ""
		for fields in range(len(row)-1):
			txt+=("'"+row[fields]+"',")
		txt+=row[-1]
		txt+="\n"
		f.write(txt)     
    
        # Check if a table already exists for this module, if not, create the table based on
        # the schema of the titles
	# UNCOMMENT below code to enable this functionality
        # query = "DESC "+module.upper()
        # c.execute(query)
        # result = c.fetchall()
        
        
        # if "ERROR" in result:
        	# query = '''CREATE TABLE '''+module.upper()+'''
        	# for title in dfd_fields:
        		# query += title + " VARCHAR(40),"
        	# query += ")"
        	# c.execute(query)
	# # try:
        	# # # At the same time update the database too
        	# # query = '''INSERT INTO '''+module.upper()+''' VALUES('''+txt+''')'''
        	# # c.execute(query)
    # f.close()
    # c.close()
    
    # return

# above is function definition
##############################################################################################################################
# below is execution
# Uncomment below if you want to run script automatically every 5 minutes

# MAIN **********************************************
# def main():
#     threading.Timer(300.0, main).start()
#     print("Start : %s" % time.ctime())
#     create_CSV_FULL("M1998","m052","pc","888878")
#     create_CSV_FULL("M1998","m052","pc","950273")
#     print("End : %s" % time.ctime())
#     print()

# main()
