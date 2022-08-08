function [ID, DATE, CPU, MEM_P, MEM_KiB] = read_ps_logs(path_to_log_file)
    %path_to_log_file ='ps-bash-grafana-2022-08-03.csv';
    readTableCSV = readtable(path_to_log_file);

    ID = readTableCSV(:,1);
    DATE = readTableCSV(:,2);
    CPU = readTableCSV(:,3);
    MEM_P = readTableCSV(:,4);
    MEM_KiB = readTableCSV(:,5);

    ID = table2array(ID);
    DATE = table2array(DATE);
    CPU = table2array(CPU);
    MEM_P = table2array(MEM_P);
    MEM_KiB = table2array(MEM_KiB);

    ID = ID.';
    CPU = CPU.';
    MEM_KiB = MEM_KiB.';
    DATE = DATE.'; 
end