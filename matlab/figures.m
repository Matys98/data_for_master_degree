clc; clear all; close all;

% [app, deployment] = chose_tool_app_deployment();

curent_dir = pwd;
curent_dir = erase(curent_dir,"matlab");

% folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";

%% Generating figures 

for app = ["static", "grafana", "tiquet"]
    for deployment = ["single", "split", "multi"]
        if app == "static" && deployment == "split"
            disp("OK")
        else
            generate_ps_figures(app, deployment);
            generate_net_figures(app, deployment);
            generate_time_figures(app, deployment);
        end
    end
end        
close all;
