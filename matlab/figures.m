clc; clear all; close all;
path_to_log_file='ps-bash-grafana-2022-08-03.csv'
[ID, DATE, CPU, MEM_P, MEM_KiB] = read_ps_logs(path_to_log_file);

path_to_file='/tool/app/deployment/i/';

figure
plot(ID, CPU);
set(gca, 'XTick', ID(1:150:1120), 'XTickLabel', DATE);
title('Zuzycie procesora(%)'); ylabel('CPU %'); xlabel("Test");
hold on
plot(ID, MEM_P);
%set(gca, 'XTick', ID(1:150:1120), 'XTickLabel', DATE);
%title('Pamiec RAM KiB'); ylabel('Zuzycie (KiB)'); xlabel("Test");

%% Dane "ID; Time; CPU %; MEM %; MEM KiB"
%% Oczyt danych CPU / MEM

ID = readDataCSV(:,1);
Date = readDataCSV(:,2);
CPU = readDataCSV(:,3);
MEM_P = readDataCSV(:,4);
MEM_KiB = readDataCSV(:,5);

%% "ID; Time; Network interface; TBPS; RBPS"
%% Oczyt danych Network

ID = readDataCSV(:,1);
Date = readDataCSV(:,2);
Interface = readDataCSV(:,3);
TBPS = readDataCSV(:,4);
RBPS = readDataCSV(:,5);

%% Wykresy
figure 
plot(xTime, CPU)
set(gca, 'XTick', P1Start:step:P1End, 'XTickLabel', time);
title('CPU %'); ylabel('Zuzycie (%)'); xlabel(data);

figure
plot(xTime, MEM_P)
set(gca, 'XTick', P1Start:step:P1End, 'XTickLabel', time);
title('Pamiec RAM %'); ylabel('Zuzycie (%)'); xlabel(data);

figure
plot(xTime, MEM_KiB)
set(gca, 'XTick', P1Start:step:P1End, 'XTickLabel', time);
title('Pamiec RAM KiB'); ylabel('Zuzycie (KiB)'); xlabel(data);

figure
plot(xTime, TBPS)
hold on
plot(xTime, RBPS)
set(gca, 'XTick', P1Start:step:P1End, 'XTickLabel', time);
title('Odebrane i otrzymane dane'); ylabel('Bity/s'); xlabel(data);
