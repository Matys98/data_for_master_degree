clc; clear all; close all;

% [tool, app, deployment] = chose_tool_app_deployment(1);

curent_dir = pwd;
curent_dir = erase(curent_dir,"matlab");

% folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";

%% Generating figures 

for tool = ["ansible", "bash", "fabric"]
    for app = ["static", "grafana", "tiquet"]
        for deployment = ["single", "split", "multi"]
            if app == "static" && deployment == "split"
                disp("OK")
            else
                generate_ps_figures_zero_avg(tool, app, deployment);
                generate_net_figures_zero_avg(tool, app, deployment);
            end
        end
    end 
end
close all;