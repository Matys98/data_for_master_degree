clc; clear all; close all;

[tool, app, deployment] = chose_tool_app_deployment();

%tool = "fabric"; app = "static"; deployment = "multi";
curent_dir = pwd;
curent_dir = erase(curent_dir,"matlab");

folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";

readings_path = string(folder_path) + string(tool) + "\" + string(app) + "\" + string(deployment);

%dir = uigetdir(convertStringsToChars(folder_path))
%[file ,path_to_ps_log_file] = uigetfile('*.csv');
ps_file = "avg_ps_readings.csv";
[ps_ID, ps_DATE, ps_CPU, ps_MEM_P, ps_MEM_KiB] = read_ps_logs(string(readings_path)+"\"+ps_file);

generate_ps_figures(ps_ID, ps_DATE, ps_CPU, ps_MEM_P, ps_MEM_KiB);

net_file = "avg_net_readings.csv";
[net_ID, net_DATE, net_NET_INTERFACE, net_TBPS, net_RBPS] = read_net_logs(string(readings_path)+"\"+net_file);

generate_net_figures(net_ID, net_DATE, net_NET_INTERFACE, net_TBPS, net_RBPS);

%[file ,path_to_time_log_file] = uigetfile('*.csv');
time_file = "avg_ps_readings.csv";
[time_ID, time_DATE, time_SECONDS, time_MINUTES] = read_time_logs(string(readings_path)+"\"+"time_data.csv");

generate_time_figures(time_ID, time_DATE, time_SECONDS, time_MINUTES);