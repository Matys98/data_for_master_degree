clc; clear all; close all;

[file ,path_to_ps_log_file] = uigetfile('*.csv');
[ps_ID, ps_DATE, ps_CPU, ps_MEM_P, ps_MEM_KiB] = read_ps_logs(string(path_to_ps_log_file)+string(file));

generate_ps_figures(ps_ID, ps_DATE, ps_CPU, ps_MEM_P, ps_MEM_KiB);

[file ,path_to_net_log_file] = uigetfile('*.csv');
[net_ID, net_DATE, net_NET_INTERFACE, net_TBPS, net_RBPS] = read_net_logs(string(path_to_net_log_file)+string(file));

generate_net_figures(net_ID, net_DATE, net_NET_INTERFACE, net_TBPS, net_RBPS);

[file ,path_to_time_log_file] = uigetfile('*.csv');
[time_ID, time_DATE, time_SECONDS, time_MINUTES] = read_time_logs(string(path_to_time_log_file)+string(file));

generate_time_figures(time_ID, time_DATE, time_SECONDS, time_MINUTES);