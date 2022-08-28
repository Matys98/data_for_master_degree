#!/bin/bash

for tool in ansible bash fabric; do
    for app in grafana tiquet; do
        for deploy in multi single split; do
            RANDOM_LOG=$(( RANDOM % 10 ))
            echo "$RANDOM_LOG" > ./$tool/$app/$deploy/random.txt
            cp ./$tool/$app/$deploy/$RANDOM_LOG/ps-* ./$tool/$app/$deploy/random_ps_readings.csv
            cp ./$tool/$app/$deploy/$RANDOM_LOG/net-* ./$tool/$app/$deploy/random_net_readings.csv
            sed -i '1d' ./$tool/$app/$deploy/random_ps_readings.csv
            sed -i '1d' ./$tool/$app/$deploy/random_net_readings.csv
            for i in {1..5}; do
                sed -i 's/;/,/' ./$tool/$app/$deploy/random_ps_readings.csv
                sed -i 's/;/,/' ./$tool/$app/$deploy/random_net_readings.csv
            done
        done
    done
done

for tool in ansible bash fabric; do
app="static"
    for deploy in multi single; do
        RANDOM_LOG=$(( RANDOM % 10 ))
        echo "$RANDOM_LOG" > ./$tool/$app/$deploy/random.txt
        cp ./$tool/$app/$deploy/$RANDOM_LOG/ps-* ./$tool/$app/$deploy/random_ps_readings.csv
        cp ./$tool/$app/$deploy/$RANDOM_LOG/net-* ./$tool/$app/$deploy/random_net_readings.csv
        sed -i '1d' ./$tool/$app/$deploy/random_ps_readings.csv
        sed -i '1d' ./$tool/$app/$deploy/random_net_readings.csv
        for i in {1..5}; do
            sed -i 's/;/,/' ./$tool/$app/$deploy/random_ps_readings.csv
            sed -i 's/;/,/' ./$tool/$app/$deploy/random_net_readings.csv
        done
    done
done