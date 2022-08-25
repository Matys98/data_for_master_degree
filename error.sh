#!/bin/bash

for tool in ansible bash fabric
do
    for app in grafana static tiquet
    do
        for deploy in multi single split
        do
                ls -la ./$tool/$app/$deploy/1/net-* >> error.txt
                echo "$tool $app $deploy" >> error.txt

	    done
    done
done
	
