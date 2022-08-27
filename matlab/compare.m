clc; clear all; close all;

tool = "ansible"

[app, deployment] = chose_tool_app_deployment();

curent_dir = pwd;
curent_dir = erase(curent_dir,"matlab");

% folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";

%% Generating figures 

generate_ps_figures_zero_avg(tool, app, deployment);
% generate_net_figures(app, deployment);