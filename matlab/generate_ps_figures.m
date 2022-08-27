function generate_ps_figures(app, deployment)
    ps_file = "avg_ps_readings.csv";
    folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";
    
    % Ansible
    readings_path = string(folder_path) + "ansible" + "\" + string(app) + "\" + string(deployment);
    [a_ID, a_DATE, a_CPU, a_MEM_P, a_MEM_KiB] = read_ps_logs(string(readings_path)+"\"+ps_file);
    
    %Bash
    readings_path = string(folder_path) + "bash" + "\" + string(app) + "\" + string(deployment);
    [b_ID, b_DATE, b_CPU, b_MEM_P, b_MEM_KiB] = read_ps_logs(string(readings_path)+"\"+ps_file);
    
    %Fabric
    readings_path = string(folder_path) + "fabric" + "\" + string(app) + "\" + string(deployment);
    [f_ID, f_DATE, f_CPU, f_MEM_P, f_MEM_KiB] = read_ps_logs(string(readings_path)+"\"+ps_file);
    
    save_file_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\images" + "\"  + string(app)+ "\" + string(deployment); %+ "\" + string(tool)+ "\" 
    ID = max([size(a_ID) size(b_ID) size(f_ID)]);
    max_ID = ID;
    s = get(0, 'ScreenSize');
    
    %% CPU
    figure('Position', [0 0 s(3) s(4)])
    plot(a_ID, a_CPU);
    hold on
    plot(b_ID, b_CPU);
    hold on
    plot(f_ID, f_CPU);
    hold off
    set(gca, 'XTick', a_ID(1:500:max_ID), 'XTickLabel', a_DATE);
    title('Zu�ycie procesora (%)'); ylabel('CPU (%)'); xlabel("Czas");
    grid on;
    legend("Ansible", "Bash", "Fabric");
    saveas(gcf, save_file_path + "\cpu_usage", 'png')
    
    %% RAM %
    figure('Position', [0 0 s(3) s(4)])
    plot(a_ID, a_MEM_P);
    hold on;
    plot(b_ID, b_MEM_P);
    hold on;
    plot(f_ID, f_MEM_P);
    hold off;
    grid on;
    legend("Ansible", "Bash", "Fabric");
    set(gca, 'XTick', a_ID(1:500:max_ID), 'XTickLabel', a_DATE);
    title('Zu�ycie pami�ci RAM (%)'); ylabel('RAM (%)'); xlabel("Czas");
    saveas(gcf, save_file_path + "\ram_usage_p", 'png')
    
    %% RAM KiB
    figure('Position', [0 0 s(3) s(4)])
    plot(a_ID, a_MEM_KiB);
    hold on;
    plot(b_ID, b_MEM_KiB);
    hold on;
    plot(f_ID, f_MEM_KiB);
    hold off;
    legend("Ansible", "Bash", "Fabric");
    set(gca, 'XTick', a_ID(1:500:max_ID), 'XTickLabel', a_DATE);
    title('Zu�ycie pami�ci RAM (KiB)'); ylabel('RAM (KiB)'); xlabel("Czas");
    grid on;
    saveas(gcf, save_file_path + "\ram_usage_kib", 'png')
end