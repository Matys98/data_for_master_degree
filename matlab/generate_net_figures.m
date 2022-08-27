function generate_net_figures(app, deployment)
    net_file = "avg_net_readings.csv";
    folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";
    
     % Ansible
    readings_path = string(folder_path) + "ansible" + "\" + string(app) + "\" + string(deployment);
    [a_ID, a_DATE, a_NET_INTERFACE, a_TBPS, a_RBPS] = read_net_logs(string(readings_path)+"\"+net_file);
    
    %Bash
    readings_path = string(folder_path) + "bash" + "\" + string(app) + "\" + string(deployment);
    [b_ID, b_DATE, b_NET_INTERFACE, b_TBPS, b_RBPS] = read_net_logs(string(readings_path)+"\"+net_file);

    %Fabric
    readings_path = string(folder_path) + "fabric" + "\" + string(app) + "\" + string(deployment);
    [f_ID, f_DATE, f_NET_INTERFACE, f_TBPS, f_RBPS] = read_net_logs(string(readings_path)+"\"+net_file);
    
    max_ID = max([a_ID b_ID f_ID]);
    save_file_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\images" + "\" + string(app)+ "\" + string(deployment); 
    s = get(0, 'ScreenSize');
    
    %% One chart
%     figure('Position', [0 0 s(3) s(4)])
%     hold on
%     yyaxis left
%     plot(a_ID, a_TBPS);
%     ylabel('b/s');
%     grid on;
%  
%     yyaxis right
%     plot(a_ID, a_RBPS);
%     legend("Wys³ane", "Odebrane")
%     set(gca, 'XTick', a_ID(1:100:max_ID), 'XTickLabel', a_DATE);
%     title('Iloœæ wys³anych i odebranych bitów na sekundê'); ylabel('b/s'); xlabel("Czas");
%     hold off
%     saveas(gcf, save_file_path + "\trbps", 'png')
    
    
    %% Subplot
    figure('Position', [0 0 s(3) s(4)])
    subplot(2,1,1); plot(a_ID, a_TBPS);
    hold on
    subplot(2,1,1); plot(b_ID, b_TBPS);
    hold on
    subplot(2,1,1); plot(f_ID, f_TBPS);
    set(gca, 'XTick', a_ID(1:100:max_ID), 'XTickLabel', a_DATE);
    title('Iloœæ wys³anych bitów na sekundê'); 
    grid on;
    legend("Ansible", "Bash", "Fabric");
    ylabel('b/s'); xlabel("Czas");
    
    subplot(2,1,2); plot(a_ID, a_RBPS);
    hold on
    subplot(2,1,2); plot(b_ID, b_RBPS);
    hold on
    subplot(2,1,2); plot(f_ID, f_RBPS);
    title('Iloœæ odebranych bitów na sekundê');
    set(gca, 'XTick', a_ID(1:100:max_ID), 'XTickLabel', a_DATE);
    grid on;
    ylabel('b/s'); xlabel("Czas");
    legend("Ansible", "Bash", "Fabric");
    saveas(gcf, save_file_path + "\copmpare_rbps_tbps", 'png')
end