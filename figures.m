clc; clear all; close all;

P1Start=1; P1End=100; 
C1= 2; C2= 12;
step = 1;

data = '3 Sierpnia 2022';

filename = 'readings.csv';
readDataCSV = csvread(filename,P1Start,C1,[P1Start C1 P1End C2]);
readTableCSV = readtable(filename);
readTableCSV = readTableCSV(:,6);

time = table2array(readTableCSV);
time = string(time(P1Start:step:P1End));
time = time.';
xTime = P1Start:P1End;

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
