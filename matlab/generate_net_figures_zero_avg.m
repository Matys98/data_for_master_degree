function generate_net_figures_zero_avg(tool, app, deployment)
    avg_ps_file = "avg_net_readings.csv";
    zero_ps_file = "zero_net_readings.csv";
    folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";
    
    % Avg
    readings_path = string(folder_path) + "ansible" + "\" + string(app) + "\" + string(deployment);
    [a_ID, a_DATE, a_NET_INTERFACE, a_TBPS, a_RBPS] = read_net_logs(string(readings_path)+"\"+avg_ps_file);
    
    % Zero
    readings_path = string(folder_path) + "ansible" + "\" + string(app) + "\" + string(deployment);
    [z_ID, z_DATE, z_NET_INTERFACE, z_TBPS, z_RBPS] = read_net_logs(string(readings_path)+"\"+zero_ps_file);
    
    save_file_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\images" + "\"  + string(app)+ "\" + string(deployment); %+ "\" + string(tool)+ "\" 
    s = get(0, 'ScreenSize');
    
    [a_x, a_y] = size(a_ID);
    [z_x, z_y] = size(z_ID);
    [m, i] = max([a_y, z_y]);
    
    if i == 1
        ID = a_ID;
        [x, max_ID] = max(a_ID);
        DATE = a_DATE;
    else
        ID = z_ID;
        [x, max_ID] = max(z_ID);
        DATE = z_DATE;
    end
    step = round(max_ID / 10);
    
    %% Subplot
    figure('Position', [0 0 s(3) s(4)])
    
    subplot(2,1,1); plot(z_ID, z_TBPS);
    hold on
    subplot(2,1,1); plot(a_ID, a_TBPS);
    hold on
    set(gca, 'XTick', ID(1:step:max_ID), 'XTickLabel', DATE); 
    grid on;
    legend("Próba zerowa", "Œrednia");
    title('Iloœæ wys³anych bitów na sekundê');
    ylabel('b/s'); xlabel("Czas");
    
    subplot(2,1,2); plot(z_ID, z_RBPS);
    hold on
    subplot(2,1,2); plot(a_ID, a_RBPS);
    set(gca, 'XTick', ID(1:step:max_ID), 'XTickLabel', DATE);
    grid on;
    legend("Œrednia", "Próba zerowa");
    title('Iloœæ odebranych bitów na sekundê');
    ylabel('b/s'); xlabel("Czas");
    
    saveas(gcf, save_file_path + "\" + string(tool) + "_zero_avg_net", 'png')
end