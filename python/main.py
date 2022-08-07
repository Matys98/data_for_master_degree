import os, re
from datetime import date, timedelta
import tkinter as tk
from tkinter import filedialog
import matplotlib.pyplot as plt
import numpy as np
# import numpy
# import matplotlib
# matplotlib.use('TkAgg') # <-- THIS MAKES IT FAST!
# import pylab


root = tk.Tk()
root.withdraw()
directory_path = filedialog.askdirectory()
# print(directory_path)

def extract_data_from_line_ps(line):
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
        a_file.append(extract_data_from_line_ps(line))

    ps_readings.close()
    return a_file

def generate_ps_log_file():
    # root = tk.Tk()
    # root.withdraw()
    # directory_path = filedialog.askdirectory()

    matched_ps_files = []
    for i in range(1,11):
        for files in os.listdir(directory_path+"/"+str(i)):
                if re.match('ps-', files): 
                    matched_ps_files.append(files) 
                    
    a_readings = []
    a_max_ID = []
    for i in range(1,11):                
        a_readings.append(read_file_ps(directory_path+"/"+str(i)+"/"+str(matched_ps_files[i-1])))
        a_max_ID.append(len(a_readings[i-1])-1)

    avg_ID = []
    avg_DATE = []
    avg_CPU = []
    avg_MEM_P = []
    avg_MEM_KiB = []
    avg_start = 1
    avg_stop = min(a_max_ID)

    # print(avg_stop, a_max_ID)
    for i in range(avg_start, avg_stop):
        avg_CPU.append(0)
        avg_MEM_P.append(0)
        avg_MEM_KiB.append(0)

    for dataset in range(0, 10):
        ID = []
        DATE = []
        CPU = []
        MEM_P = []
        MEM_KiB = []
        # print(dataset, len(a_readings[dataset])-1)
        for index in range(1, len(a_readings[dataset])-1):
            ID.append(a_readings[dataset][index][0])
            DATE.append(a_readings[dataset][index][1])
            CPU.append(a_readings[dataset][index][2])
            MEM_P.append(a_readings[dataset][index][3])
            MEM_KiB.append(a_readings[dataset][index][4])
            if index < avg_stop-1:
                avg_ID.append(a_readings[dataset][index][0])
                avg_DATE.append(a_readings[dataset][index][1])
                avg_CPU[index] += float(a_readings[dataset][index][2])
                avg_MEM_P[index] += float(a_readings[dataset][index][3])
                avg_MEM_KiB[index] += float(a_readings[dataset][index][4])

    # print(ID[0], DATE[0], CPU[0], MEM_P[0], MEM_KiB[0])
    avg_cpu = [avg_CPUs / 10.0 for avg_CPUs in avg_CPU]
    avg_ram_p = [avg_MEM_Ps / 10.0 for avg_MEM_Ps in avg_MEM_P]
    avg_ram_kib = [avg_MEM_KiBs / 10.0 for avg_MEM_KiBs in avg_MEM_KiB]

    f = open(directory_path + '/avg_ps_readings.csv', 'a', encoding='utf-8', errors='ignore')
    for line in range(len(avg_cpu)-1):
        f.write(str(avg_ID[line]) + "," + str(avg_DATE[line]) + "," + str(avg_cpu[line]) + "," + str(avg_ram_p[line]) + "," + str(avg_ram_kib[line]) + '\n')
    f.close()

# --------------------------------
# --------------------------------
# ------------- NET --------------
# --------------------------------
# --------------------------------

def extract_data_from_line_net(line):
    if "Build Completed" in line:
        return 0
    
    splited_data = line.split(";")

    ID = splited_data[0]
    DATE = splited_data[1]
    NET_INTERFACE = splited_data[2]
    TBPS = splited_data[3]
    RBPS = splited_data[4]

    RBPS = RBPS.strip()
    # print(ID, DATE, CPU, MEM_P, MEM_KiP)
    readings = [ID, DATE, NET_INTERFACE, TBPS, RBPS]
    return readings

def read_file_net(path_to_file):
    # ID; Time; Network interface; TBPS; RBPS
    # print(path_to_file)
    net_readings = open(path_to_file, "r", encoding='utf-8', errors='ignore')

    a_file = []                
    for line in net_readings:
    #   print(line)
        a_file.append(extract_data_from_line_net(line))

    net_readings.close()
    return a_file

def generate_net_log_file():
    matched_net_files = []
    for i in range(1,11):
        for files in os.listdir(directory_path+"/"+str(i)):
                if re.match('net-', files): 
                    matched_net_files.append(files) 

    a_readings = []
    a_max_ID = []
    for i in range(1,11):                
        a_readings.append(read_file_net(directory_path+"/"+str(i)+"/"+str(matched_net_files[i-1])))
        a_max_ID.append(len(a_readings[i-1])-1)

    avg_ID = []
    avg_DATE = []
    avg_NET_INTERFACE = []
    avg_TBPS = []
    avg_RBPS = []
    avg_start = 1
    avg_stop = min(a_max_ID)

    # print(avg_stop, a_max_ID)
    for i in range(avg_start, avg_stop):
        avg_TBPS.append(0)
        avg_RBPS.append(0)

    for dataset in range(0, 10):
        ID = []
        DATE = []
        NET_INTERFACE = []
        TBPS = []
        RBPS = []
        # print(dataset, len(a_readings[dataset])-1)
        for index in range(1, len(a_readings[dataset])-1):
            ID.append(a_readings[dataset][index][0])
            DATE.append(a_readings[dataset][index][1])
            NET_INTERFACE.append(a_readings[dataset][index][2])
            TBPS.append(a_readings[dataset][index][3])
            RBPS.append(a_readings[dataset][index][4])
            if index < avg_stop-1:
                avg_ID.append(a_readings[dataset][index][0])
                avg_DATE.append(a_readings[dataset][index][1])
                avg_NET_INTERFACE.append(a_readings[dataset][index][2])
                avg_TBPS[index] += float(a_readings[dataset][index][3])
                avg_RBPS[index] += float(a_readings[dataset][index][4])

    # print(ID[0], DATE[0], CPU[0], MEM_P[0], MEM_KiB[0])
    avg_tbps = [avg_TBPSs / 10.0 for avg_TBPSs in avg_TBPS]
    avg_rbps = [avg_RBPSs / 10.0 for avg_RBPSs in avg_RBPS]

    f = open(directory_path + '/avg_net_readings.csv', 'a', encoding='utf-8', errors='ignore')
    for line in range(len(avg_tbps)-1):
        f.write(str(avg_ID[line]) + "," + str(avg_DATE[line]) + "," + str(avg_NET_INTERFACE[line]) + "," + str(avg_tbps[line]) + "," + str(avg_rbps[line]) + '\n')
    f.close()


def generate_latex_table_with_time():
    


    return 0

def extract_time_chart_data(line):
    if "Build Completed" in line:
        return 0
    
    splited_data = line.split("|")
    DATE = splited_data[0]
    time_in_seconds = splited_data[1]
    time_in_minutes = splited_data[2]
    DATE = DATE[len("Deploy statrted at "):len(DATE)]
    time_in_seconds = time_in_seconds[len(" In seconds: "):len(time_in_seconds)]
    time_in_minutes = time_in_minutes[len(" In minutes: "):len(time_in_minutes)]
    time_in_minutes = time_in_minutes.strip()
    return [DATE, time_in_seconds, time_in_minutes]

def generate_time_chart_data():
    time_readings = open(directory_path+"/README.md", "r", encoding='utf-8', errors='ignore')

    a_file_content = []                
    for line in time_readings:
        if "Deploy statrted at" in line:
            a_file_content.append(extract_time_chart_data(line))

    time_readings.close()
    # f = open(directory_path + '/time_data.csv', 'a', encoding='utf-8', errors='ignore')
    # for line in range(len(avg_tbps)-1):
    #     f.write(str(a_file_content[line]) + "," + str(a_file_content[line]) + "," + str(a_file_content[line]) + "," + str(avg_tbps[line]) + "," + str(avg_rbps[line]) + '\n')
    # f.close()
    return a_file_content

# generate_ps_log_file()
# generate_net_log_file()

print(generate_time_chart_data())