This project is the senior capstone of Burson Yang and Laura Lehoczki of NYUSH class of 2019
Our project topic and objective was to solve the automated data conversion, database management and data analysis of one of  Thyssenkrupp's Shanghai plants (PHS).

Functionality and usage:
- auto_csv.py: transforms machine data into CSV and saves it into the database
  - Open command line on Windows
  - Type "python " and drag and drop the script or insert path to script into command line
  - CSV's will be generated in the CSV folder
  
- visualize_from_db.py: creates the correlation graph for new data in the database since the last analysis
  - Open command line
  - Type "python " and drag and drop the script or insert path to script into command line  
  - Graphs will be generated in the Analysis folder
  
 - visualize_csv.py: creates the correlation graph for the specified date
 -  Only works for car parts whose data has been recorded for modules M04, M06 and M052
   - Open command line
   - Drag and dropt script into command line
   - Enter date in specified format when prompted and hit enter
  
- Machines.sql: creates the tables of interest in the database
  - No need to run it again, but if tables need to be recreated, follow instructions in the header of the script
  
  The rest of the scripts are utilities used by the above programs
Note: the visualizers only work for the modules originally specified: M06 and M052
