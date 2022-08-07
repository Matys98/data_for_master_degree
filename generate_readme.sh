#!/bin/bash

for tool in ansible bash fabric
do 
    for app in grafana static tiquet
    do
        for deploy in multi single split
        do
            echo "# READINGS 1-10 $tool $app $deploy" > ./$tool/$app/$deploy/README.md
	    echo "" >> ./$tool/$app/$deploy/README.md
            echo "\`\`\`" >> ./$tool/$app/$deploy/README.md
            for i in {1..10}
            do
                cat ./$tool/$app/$deploy/$i/deploy_time.txt >> ./$tool/$app/$deploy/README.md
            done
            echo "\`\`\`" >> ./$tool/$app/$deploy/README.md
        done
        echo "Done $tool $app $deploy"
    done
    echo "Done $tool $app"
done
echo "DONE"
