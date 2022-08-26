function generate_ps_figures(ID, DATE, CPU, MEM_P, MEM_KiB, tool, app, deployment)
    file_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\images" + "\" + string(tool)+ "\" + string(app)+ "\" + string(deployment); 
    [x,max_ID] = size(ID);
    s = get(0, 'ScreenSize');
    figure('Position', [0 0 s(3) s(4)])
    plot(ID, CPU);
    set(gca, 'XTick', ID(1:500:max_ID), 'XTickLabel', DATE);
    title('Zu¿ycie procesora (%)'); ylabel('CPU (%)'); xlabel("Czas");
    grid on;
    disp([path 'ps.png'])
    saveas(gcf, file_path + "\cpu_usage", 'png')
    
    figure('Position', [0 0 s(3) s(4)])
    plot(ID, MEM_P);
    grid on;
    set(gca, 'XTick', ID(1:500:max_ID), 'XTickLabel', DATE);
    title('Zu¿ycie pamiêci RAM (%)'); ylabel('RAM (%)'); xlabel("Czas");
    saveas(gcf, file_path + "\ram_usage_p", 'png')
    
    figure('Position', [0 0 s(3) s(4)])
    plot(ID, MEM_KiB);
    set(gca, 'XTick', ID(1:500:max_ID), 'XTickLabel', DATE);
    title('Zu¿ycie pamiêci RAM (KiB)'); ylabel('RAM (KiB)'); xlabel("Czas");
    grid on;
    saveas(gcf, file_path + "\ram_usage_kib", 'png')
end