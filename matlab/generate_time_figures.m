function generate_time_figures(app, deployment)
    folder_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\";

    % Ansible
    readings_path = string(folder_path) + "ansible" + "\" + string(app) + "\" + string(deployment);
    [a_ID, a_DATE, a_SECONDS, a_MINUTES] = read_time_logs(string(readings_path)+"\"+"time_data.csv");
    
    %Bash
    readings_path = string(folder_path) + "bash" + "\" + string(app) + "\" + string(deployment);
    [b_ID, b_DATE, b_SECONDS, b_MINUTES] = read_time_logs(string(readings_path)+"\"+"time_data.csv");

    %Fabric
    readings_path = string(folder_path) + "fabric" + "\" + string(app) + "\" + string(deployment);
    [f_ID, f_DATE, f_SECONDS, f_MINUTES] = read_time_logs(string(readings_path)+"\"+"time_data.csv");

    save_file_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\images" + "\" + string(app)+ "\" + string(deployment); 
    s = get(0, 'ScreenSize');
    
    %% Time in seconds
    figure('Position', [0 0 s(3) s(4)])
    bar(a_ID, [a_SECONDS', b_SECONDS', f_SECONDS']); %[a_ID; b_ID; f_ID], 
    title('Czas wdra?ania aplikacji w sekundach'); ylabel('Czas (s)'); xlabel("Numer pr?by");
    text((1:length(a_SECONDS)) - 0.15,a_SECONDS,num2str(round(a_SECONDS,2)'),'vert','bottom','horiz','right');
    text(1:length(b_SECONDS),b_SECONDS,num2str(round(b_SECONDS,2)'),'vert','bottom','horiz','center');
    text((1:length(f_SECONDS)) + 0.15,f_SECONDS,num2str(round(f_SECONDS,2)'),'vert','bottom','horiz','left');
    grid on;
    box off
    legend("Ansible", "Bash", "Fabric");
    saveas(gcf, save_file_path + "\time_sec", 'png')
    
    %% Time in minutes
%     figure('Position', [0 0 s(3) s(4)])
%     bar(a_ID, [a_MINUTES', b_MINUTES', f_MINUTES']);
%     title('Czas wdra?ania aplikacji w minutach'); ylabel('Czas (min)'); xlabel("Numer pr?by");
%     text((1:length(a_MINUTES)) - 0.15, a_MINUTES, num2str(round(a_MINUTES,2)') ,'vert', 'bottom', 'horiz','right');
%     text(1:length(b_MINUTES),b_MINUTES,num2str(round(b_MINUTES,2)'),'vert','bottom','horiz','center'); 
%     text((1:length(f_MINUTES)) + 0.15,f_MINUTES,num2str(round(f_MINUTES,2)'),'vert','bottom','horiz','left'); 
%     grid on;
%     box off
%     legend("Ansible", "Bash", "Fabric");
%     saveas(gcf, save_file_path + "\time_min", 'png')
end