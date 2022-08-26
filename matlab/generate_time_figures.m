function generate_time_figures(ID, DATE, SECONDS, MINUTES, tool, app, deployment)
    file_path = "C:\Users\Michal\Desktop\Projekty\data_for_master_degree\images" + "\" + string(tool)+ "\" + string(app)+ "\" + string(deployment); 
    s = get(0, 'ScreenSize');
    figure('Position', [0 0 s(3) s(4)])
    bar(ID, SECONDS);
    title('Czas wdra¿ania aplikacji w sekundach'); ylabel('Czas (s)'); xlabel("Numer próby");
    text(1:length(SECONDS),SECONDS,num2str(round(SECONDS,2)'),'vert','bottom','horiz','center');
    grid on;
    box off
    saveas(gcf, file_path + "\time_sec", 'png')
    
    figure('Position', [0 0 s(3) s(4)])
    bar(ID,MINUTES);
    title('Czas wdra¿ania aplikacji w minutach'); ylabel('Czas (min)'); xlabel("Numer próby");
    text(1:length(MINUTES),MINUTES,num2str(round(MINUTES,2)'),'vert','bottom','horiz','center'); 
    grid on;
    box off
    saveas(gcf, file_path + "\time_min", 'png')
end