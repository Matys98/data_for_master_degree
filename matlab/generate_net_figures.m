function generate_net_figures(ID, DATE, NET_INTERFACE, TBPS, RBPS)
    [x,max_ID] = size(ID);
    figure(4)
    hold on
    yyaxis left
    plot(ID, TBPS);
    ylabel('b/s');
    grid on;
 
    yyaxis right
    plot(ID, RBPS);
    legend("Wys³ane", "Odebrane")
    set(gca, 'XTick', ID(1:100:max_ID), 'XTickLabel', DATE);
    title('Iloœæ wys³anych i odebranych bitów na sekundê'); ylabel('b/s'); xlabel("Czas");
    hold off
    
    figure(7)
    subplot(2,1,1); plot(ID, TBPS);
    set(gca, 'XTick', ID(1:100:max_ID), 'XTickLabel', DATE);
    title('Iloœæ wys³anych bitów na sekundê'); 
    grid on;
    ylabel('b/s'); xlabel("Czas");
    
    subplot(2,1,2); plot(ID, RBPS);
    title('Iloœæ odebranych bitów na sekundê');
    set(gca, 'XTick', ID(1:100:max_ID), 'XTickLabel', DATE);
    grid on;
    ylabel('b/s'); xlabel("Czas");
end