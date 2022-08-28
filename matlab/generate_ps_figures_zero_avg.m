function generate_ps_figures_zero_avg(tool, app, deployment)
    avg_ps_file = "avg_ps_readings.csv";
    zero_ps_file = "zero_ps_readings.csv";
    random_ps_file = "random_ps_readings.csv";
    folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";
    
    % Avg
    readings_path = string(folder_path) + string(tool) + "\" + string(app) + "\" + string(deployment);
    [a_ID, a_DATE, a_CPU, a_MEM_P, a_MEM_KiB] = read_ps_logs(string(readings_path)+"\"+avg_ps_file);
    
    % Zero
    readings_path = string(folder_path) + string(tool) + "\" + string(app) + "\" + string(deployment);
    [z_ID, z_DATE, z_CPU, z_MEM_P, z_MEM_KiB] = read_ps_logs(string(readings_path)+"\"+zero_ps_file);
    
    % Random
    readings_path = string(folder_path) + string(tool) + "\" + string(app) + "\" + string(deployment);
    [r_ID, r_DATE, r_CPU, r_MEM_P, r_MEM_KiB] = read_ps_logs(string(readings_path)+"\"+random_ps_file);
    
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
    
    subplot(2,1,1); plot(z_ID, z_CPU);
    hold on
    subplot(2,1,1); plot(r_ID, r_CPU);
    hold on
    subplot(2,1,1); plot(a_ID, a_CPU);
    set(gca, 'XTick', ID(1:step:max_ID), 'XTickLabel', DATE); 
    grid on;
    legend("Próba zerowa", "Losowo wybrana próba", "Œrednia");
    title('Porównanie zu¿ycie procesora (próba zerowa z 10 pomiarami)'); ylabel('CPU (%)'); xlabel("Czas");
    
    subplot(2,1,2); plot(z_ID, z_MEM_KiB);
    hold on
    subplot(2,1,2); plot(r_ID, r_MEM_KiB);
    hold on
    subplot(2,1,2); plot(a_ID, a_MEM_KiB);
    set(gca, 'XTick', ID(1:step:max_ID), 'XTickLabel', DATE);
    grid on;
    legend("Próba zerowa", "Losowo wybrana próba", "Œrednia");
    title('Porównanie zu¿ycie pamieci RAM (próba zerowa z 10 pomiarami)'); ylabel('RAM (KiB)'); xlabel("Czas");
    saveas(gcf, save_file_path + "\" + string(tool) + "_zero_avg_cpu_ram", 'png')
end