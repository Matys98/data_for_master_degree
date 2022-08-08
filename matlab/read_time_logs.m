function [ID, DATE, SECONDS, MINUTES] = read_time_logs(path_to_log_file)
    %path_to_log_file ='ps-bash-grafana-2022-08-03.csv';
    readTableCSV = readtable(path_to_log_file);

    ID = readTableCSV(:,1);
    DATE = readTableCSV(:,2);
    SECONDS = readTableCSV(:,3);
    MINUTES = readTableCSV(:,4);

    ID = table2array(ID);
    DATE = table2array(DATE);
    SECONDS = table2array(SECONDS);
    MINUTES = table2array(MINUTES);
    
    ID = ID.';
    DATE = DATE.';
    SECONDS = SECONDS.';
    MINUTES = MINUTES.'; 
end