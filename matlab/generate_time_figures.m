function generate_time_figures(ID, DATE, SECONDS, MINUTES)
    figure(5)
    bar(ID, SECONDS);
    title('Czas wdra¿ania aplikacji w sekundach'); ylabel('Czas (s)'); xlabel("Numer próby");
    text(1:length(SECONDS),SECONDS,num2str(round(SECONDS,2)'),'vert','bottom','horiz','center'); 
    box off
    
    figure(6)
    bar(ID,MINUTES);
    title('Czas wdra¿ania aplikacji w minutach'); ylabel('Czas (min)'); xlabel("Numer próby");
    text(1:length(MINUTES),MINUTES,num2str(round(MINUTES,2)'),'vert','bottom','horiz','center'); 
    box off
end