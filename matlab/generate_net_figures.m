function generate_net_figures(ID, DATE, NET_INTERFACE, TBPS, RBPS)
    [x,max_ID] = size(ID);
    figure(4)
    plot(ID, TBPS);
    hold on
    plot(ID, RBPS);
    legend("Wys³ane", "Odebrane")
    set(gca, 'XTick', ID(1:100:max_ID), 'XTickLabel', DATE);
    title('Iloœæ wys³anych i odebranych bitów na sekundê'); ylabel('b/s'); xlabel("Czas");
    
end