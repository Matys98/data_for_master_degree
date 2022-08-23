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
    legend("Wys�ane", "Odebrane")
    set(gca, 'XTick', ID(1:100:max_ID), 'XTickLabel', DATE);
    title('Ilo�� wys�anych i odebranych bit�w na sekund�'); ylabel('b/s'); xlabel("Czas");
    hold off
    
    figure(7)
    subplot(2,1,1); plot(ID, TBPS);
    set(gca, 'XTick', ID(1:100:max_ID), 'XTickLabel', DATE);
    title('Ilo�� wys�anych bit�w na sekund�'); 
    grid on;
    ylabel('b/s'); xlabel("Czas");
    
    subplot(2,1,2); plot(ID, RBPS);
    title('Ilo�� odebranych bit�w na sekund�');
    set(gca, 'XTick', ID(1:100:max_ID), 'XTickLabel', DATE);
    grid on;
    ylabel('b/s'); xlabel("Czas");
end