function [ID, DATE, NET_INTERFACE, TBPS, RBPS] = read_net_logs(path_to_log_file)
    %path_to_log_file ='ps-bash-grafana-2022-08-03.csv';
    readTableCSV = readtable(path_to_log_file);

    ID = readTableCSV(:,1);
    DATE = readTableCSV(:,2);
    NET_INTERFACE = readTableCSV(:,3);
    TBPS = readTableCSV(:,4);
    RBPS = readTableCSV(:,5);

    ID = table2array(ID);
    DATE = table2array(DATE);
    NET_INTERFACE = table2array(NET_INTERFACE);
    TBPS = table2array(TBPS);
    RBPS = table2array(RBPS);
    
    ID = ID.';
    DATE = DATE.';
    TBPS = TBPS.';
    RBPS = RBPS.'; 
end