#!/bin/bash

for tool in ansible bash fabric; do
    for app in grafana tiquet; do
        for deploy in multi single split; do
            ls -la ./$tool/$app/$deploy/0/net-* >>error.txt
            ls -la ./$tool/$app/$deploy/0/ps-* >>error.txt
            echo "$tool $app $deploy" >>error.txt
            echo "\n" >>error.txt
        done
    done
done

for tool in ansible bash fabric; do
    app="static"
    for deploy in multi single; do
        ls -la ./$tool/$app/$deploy/0/net-* >>error.txt
        ls -la ./$tool/$app/$deploy/0/ps-* >>error.txt
        echo "$tool $app $deploy" >>error.txt
        echo "\n" >>error.txt
    done
done
