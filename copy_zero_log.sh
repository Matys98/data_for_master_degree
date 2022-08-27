#!/bin/bash

for tool in ansible bash fabric; do
    for app in grafana tiquet; do
        for deploy in multi single split; do
            cp ./$tool/$app/$deploy/0/ps-* ./$tool/$app/$deploy/zero_ps_readings.csv
            cp ./$tool/$app/$deploy/0/net-* ./$tool/$app/$deploy/zero_net_readings.csv
            sed -i '1d' ./$tool/$app/$deploy/zero_ps_readings.csv
            sed -i '1d' ./$tool/$app/$deploy/zero_net_readings.csv
            sed -i 's/;/,/' ./$tool/$app/$deploy/zero_ps_readings.csv
            sed -i 's/;/,/' ./$tool/$app/$deploy/zero_net_readings.csv
        done
    done
done

for tool in ansible bash fabric; do
app="static"
    for deploy in multi single; do
        cp ./$tool/$app/$deploy/0/ps-* ./$tool/$app/$deploy/zero_ps_readings.csv
        cp ./$tool/$app/$deploy/0/net-* ./$tool/$app/$deploy/zero_net_readings.csv
        sed -i '1d' ./$tool/$app/$deploy/zero_ps_readings.csv
        sed -i '1d' ./$tool/$app/$deploy/zero_net_readings.csv
        sed -i 's/;/,/' ./$tool/$app/$deploy/zero_ps_readings.csv
        sed -i 's/;/,/' ./$tool/$app/$deploy/zero_net_readings.csv
    done
done