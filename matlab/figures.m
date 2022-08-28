clc; clear all; close all;

[tool, app, deployment] = chose_tool_app_deployment(0);

curent_dir = pwd;
curent_dir = erase(curent_dir,"matlab");

% folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";

%% Generating figures 

generate_ps_figures(app, deployment);
generate_net_figures(app, deployment);
generate_time_figures(app, deployment);