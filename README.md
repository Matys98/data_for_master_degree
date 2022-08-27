# Comparative analysis of infrastructure provisioning tool based on web application - data repo.

This is my master degree project. 
Repository includes all provisioning tools code and benchmarks prepared for them.
  
## File structure 

```
.
├── ...
├── data_for_master_degree                                # Repository folder
│   ├── bash                                              # Tool used for research
│   │   ├── static                                        # Application used for research
│   │   │   ├── single                                    # Deployment type used for research
│   │   │   │   ├── 0                                     # index of reserch attempt
│   │   │   │   │   ├── deploy_time.txt                   # File with deployment time and start date
│   │   │   │   │   ├── net-bash-grafana-2022-08-03.log   # Readings from network interface
│   │   │   │   │   └── ps-bash-grafana-2022-08-03.log    # Readings from CPU and RAM usage
│   │   │   │   ├── 1
│   │   │   │   │   └── ...
│   │   │   │   └── N
│   │   │   │       └── ...
│   │   │   └── multi
│   │   ├── grafana         
│   │   │   ├── single
│   │   │   └── ...
│   │   └── tiquet
│   │       ├── single
│   │       └── ...
│
└── ...
```

```bash
# structure
./data_for_master_degree
        /bash/grafana/multi/0/

# example
./data_for_master_degree/bash/grafana/multi/0/
```


## Matlab
main file - figures.m

## Python
main file - main.py

## Readings (Charts example)
Fabric - Static - Multi
 
### CPU Usage
![plot](./images/static/multi/cpu_usage.png)

### RAM Usage in %
![plot](./images/static/multi/ram_usage_p.png)

### RAM Usage in Kib
![plot](./images/static/multi/ram_usage_kib.png)

### NET TBPS and RBPS one
![plot](./images/static/multi/trbps.png)

### NET TBPS and RBPS split
![plot](./images/static/multi/copmpare_rbps_tbps.png)

### TIME in seconds
![plot](./images/static/multi/time_sec.png)

### TIME in minutes
![plot](./images/static/multi/time_min.png)


```

############################################################################################
############################################################################################
                                        
############################################################################################
############################################################################################

```

## All of readings
### Static single
![plot](./images/static/single/cpu_usage.png)
![plot](./images/static/single/ram_usage_kib.png)
![plot](./images/static/single/copmpare_rbps_tbps.png)
![plot](./images/static/single/time_sec.png)

### Static multi
![plot](./images/static/multi/cpu_usage.png)
![plot](./images/static/multi/ram_usage_kib.png)
![plot](./images/static/multi/copmpare_rbps_tbps.png)
![plot](./images/static/multi/time_sec.png)

### Grafana single
![plot](./images/grafana/single/cpu_usage.png)
![plot](./images/grafana/single/ram_usage_kib.png)
![plot](./images/grafana/single/copmpare_rbps_tbps.png)
![plot](./images/grafana/single/time_sec.png)

### Grafana split
![plot](./images/grafana/split/cpu_usage.png)
![plot](./images/grafana/split/ram_usage_kib.png)
![plot](./images/grafana/split/copmpare_rbps_tbps.png)
![plot](./images/grafana/split/time_sec.png)

### Grafana multi
![plot](./images/grafana/multi/cpu_usage.png)
![plot](./images/grafana/multi/ram_usage_kib.png)
![plot](./images/grafana/multi/copmpare_rbps_tbps.png)
![plot](./images/grafana/multi/time_sec.png)

### Tiquet single
![plot](./images/tiquet/single/cpu_usage.png)
![plot](./images/tiquet/single/ram_usage_kib.png)
![plot](./images/tiquet/single/copmpare_rbps_tbps.png)
![plot](./images/tiquet/single/time_sec.png)

### Tiquet split
![plot](./images/tiquet/split/cpu_usage.png)
![plot](./images/tiquet/split/ram_usage_kib.png)
![plot](./images/tiquet/split/copmpare_rbps_tbps.png)
![plot](./images/tiquet/split/time_sec.png)

### Tiquet multi
![plot](./images/tiquet/multi/cpu_usage.png)
![plot](./images/tiquet/multi/ram_usage_kib.png)
![plot](./images/tiquet/multi/copmpare_rbps_tbps.png)
![plot](./images/tiquet/multi/time_sec.png)
