function generate_ps_figures_zero_avg(tool, app, deployment)
    avg_ps_file = "avg_ps_readings.csv";
    zero_ps_file = "zero_ps_readings.csv";
    folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";
    
    % Avg
    readings_path = string(folder_path) + string(tool) + "\" + string(app) + "\" + string(deployment);
    [a_ID, a_DATE, a_CPU, a_MEM_P, a_MEM_KiB] = read_ps_logs(string(readings_path)+"\"+avg_ps_file);
    
    % Zero
    readings_path = string(folder_path) + string(tool) + "\" + string(app) + "\" + string(deployment);
    [z_ID, z_DATE, z_CPU, z_MEM_P, z_MEM_KiB] = read_ps_logs(string(readings_path)+"\"+zero_ps_file);
    
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
        ID = f_ID;
        [x, max_ID] = max(z_ID);
        DATE = z_DATE;
    end
    step = round(max_ID / 10);
    
    %% Subplot
    figure('Position', [0 0 s(3) s(4)])
    
    subplot(2,1,1); plot(a_ID, a_CPU);
    hold on
    subplot(2,1,1); plot(z_ID, z_CPU);
    hold on
    set(gca, 'XTick', ID(1:step:max_ID), 'XTickLabel', DATE); 
    grid on;
    legend("�rednia", "Pr�ba zerowa");
    title('Por�wnanie zu�ycie procesora (pr�ba zerowa z 10 pomiarami)'); ylabel('CPU (%)'); xlabel("Czas");
    
    subplot(2,1,2); plot(a_ID, a_MEM_KiB);
    hold on
    subplot(2,1,2); plot(z_ID, z_MEM_KiB);
    set(gca, 'XTick', ID(1:step:max_ID), 'XTickLabel', DATE);
    grid on;
    legend("�rednia", "Pr�ba zerowa");
    title('Por�wnanie zu�ycie pamieci RAM (pr�ba zerowa z 10 pomiarami)'); ylabel('CPU (%)'); xlabel("Czas");
    
    saveas(gcf, save_file_path + "\" + string(tool) + "_zero_avg_cpu_ram", 'png')
end