function generate_ps_figures(ID, DATE, CPU, MEM_P, MEM_KiB)
    [x,max_ID] = size(ID);
    figure(1)
    plot(ID, CPU);
    set(gca, 'XTick', ID(1:500:max_ID), 'XTickLabel', DATE);
    title('Zu¿ycie procesora (%)'); ylabel('CPU (%)'); xlabel("Czas");
    grid on;
    
    figure(2)
    plot(ID, MEM_P);
    grid on;
    set(gca, 'XTick', ID(1:500:max_ID), 'XTickLabel', DATE);
    title('Zu¿ycie pamiêci RAM (%)'); ylabel('RAM (%)'); xlabel("Czas");
    
    figure(3)
    plot(ID, MEM_KiB);
    set(gca, 'XTick', ID(1:500:max_ID), 'XTickLabel', DATE);
    title('Zu¿ycie pamiêci RAM (KiB)'); ylabel('RAM (KiB)'); xlabel("Czas");
    grid on;
end