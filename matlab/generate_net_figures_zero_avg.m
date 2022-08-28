function generate_net_figures_zero_avg(tool, app, deployment)
    avg_net_file = "avg_net_readings.csv";
    zero_net_file = "zero_net_readings.csv";
    random_net_file = "random_ps_readings.csv";
    folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";
    
    % Avg
    readings_path = string(folder_path) + "ansible" + "\" + string(app) + "\" + string(deployment);
    [a_ID, a_DATE, a_NET_INTERFACE, a_TBPS, a_RBPS] = read_net_logs(string(readings_path)+"\"+avg_net_file);
    
    % Zero
    readings_path = string(folder_path) + "ansible" + "\" + string(app) + "\" + string(deployment);
    [z_ID, z_DATE, z_NET_INTERFACE, z_TBPS, z_RBPS] = read_net_logs(string(readings_path)+"\"+zero_net_file);
    
    % Random
    readings_path = string(folder_path) + string(tool) + "\" + string(app) + "\" + string(deployment);
    [r_ID, r_DATE, r_NET_INTERFACE, r_TBPS, r_RBPS] = read_net_logs(string(readings_path)+"\"+random_net_file);
    
    save_file_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\images" + "\"  + string(app)+ "\" + string(deployment); %+ "\" + string(tool)+ "\" 
    s = get(0, 'ScreenSize');
    
    [a_x, a_y] = size(a_ID);
    [z_x, z_y] = size(z_ID);
    [r_x, r_y] = size(r_ID);
    [m, i] = max([a_y, z_y, r_y]);
    
    if i == 1
        ID = a_ID;
        [x, max_ID] = max(a_ID);
        DATE = a_DATE;
    elseif i == 2
        ID = z_ID;
        [x, max_ID] = max(z_ID);
        DATE = z_DATE;
    else
        ID = r_ID;
        [x, max_ID] = max(r_ID);
        DATE = r_DATE;
    end
    step = round(max_ID / 10);
    
    %% Subplot
    figure('Position', [0 0 s(3) s(4)])
    
    subplot(2,1,1); plot(z_ID, z_TBPS);
    hold on
    subplot(2,1,1); plot(r_ID, r_TBPS);
    hold on
    subplot(2,1,1); plot(a_ID, a_TBPS);
    set(gca, 'XTick', ID(1:step:max_ID), 'XTickLabel', DATE); 
    grid on;
    legend("Próba zerowa", "Losowo wybrana próba", "Œrednia");
    title('Iloœæ wys³anych bitów na sekundê');
    ylabel('b/s'); xlabel("Czas");
    
    subplot(2,1,2); plot(z_ID, z_RBPS);
    hold on
    subplot(2,1,2); plot(r_ID, r_RBPS);
    hold on
    subplot(2,1,2); plot(a_ID, a_RBPS);
    set(gca, 'XTick', ID(1:step:max_ID), 'XTickLabel', DATE);
    grid on;
    legend("Próba zerowa", "Losowo wybrana próba", "Œrednia");
    title('Iloœæ odebranych bitów na sekundê');
    ylabel('b/s'); xlabel("Czas");
    
    saveas(gcf, save_file_path + "\" + string(tool) + "_zero_avg_net", 'png')
end