import os, re
from datetime import date, timedelta
import tkinter as tk
from tkinter import filedialog

root = tk.Tk()
root.withdraw()
# file_path = filedialog.askopenfilename()
directory_path = filedialog.askdirectory()
print(directory_path)

def extract_data_from_line(line):
    if "Build Completed" in line:
        return 0
    
    splited_data = line.split(";")

    ID = splited_data[0]
    DATE = splited_data[1]
    CPU = splited_data[2]
    MEM_P = splited_data[3]
    MEM_KiP = splited_data[4]

    MEM_KiP = MEM_KiP.strip()
    # print(ID, DATE, CPU, MEM_P, MEM_KiP)
    readings = [ID, DATE, CPU, MEM_P, MEM_KiP]
    return readings

def read_file_ps(path_to_file):
    # ID, DATE, CPU, MEM_P, MEM_KiB
    # print(path_to_file)
    ps_readings = open(path_to_file, "r", encoding='utf-8', errors='ignore')

    a_file = []                
    for line in ps_readings:
    #   print(line)
        a_file.append(extract_data_from_line(line))

    ps_readings.close()
    return a_file

matched_files = []
for i in range(1,11):
    for files in os.listdir(directory_path+"/"+str(i)):
            if re.match('ps-', files): 
                matched_files.append(files) 
                
a_readings = []                
for i in range(1,11):                
    a_readings.append(read_file_ps(directory_path+"/"+str(i)+"/"+str(matched_files[i-1])))

print(a_readings[1][1][1])
print(a_readings[2][1])
print(a_readings[3][1])