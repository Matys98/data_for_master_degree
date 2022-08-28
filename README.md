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
Static - Multi
 
### Usage

#### CPU Usage
![plot](./images/static/multi/cpu_usage.png)

#### RAM Usage in %
![plot](./images/static/multi/ram_usage_p.png)

#### RAM Usage in Kib
![plot](./images/static/multi/ram_usage_kib.png)

#### CPU and RAM %
![plot](./images/static/multi/cpu_ram.png)

### NET

#### NET TBPS and RBPS split
![plot](./images/static/multi/copmpare_rbps_tbps.png)

### TIME

#### TIME in seconds
![plot](./images/static/multi/time_sec.png)

#### TIME in minutes
![plot](./images/static/multi/time_min.png)

### Zero Random Avrage

#### Ansible
![plot](./images/static/multi/zero_rand_avg/ansible_zero_avg_cpu_ram.png)
![plot](./images/static/multi/zero_rand_avg/ansible_zero_avg_net.png)

#### Bash
![plot](./images/static/multi/zero_rand_avg/bash_zero_avg_cpu_ram.png)
![plot](./images/static/multi/zero_rand_avg/bash_zero_avg_net.png)

#### Fabric
![plot](./images/static/multi/zero_rand_avg/fabric_zero_avg_cpu_ram.png)
![plot](./images/static/multi/zero_rand_avg/fabric_zero_avg_net.png)

```

############################################################################################
############################################################################################
                                        
############################################################################################
############################################################################################

```

## All of readings
### Static single
![plot](./images/static/single/cpu_ram.png)
![plot](./images/static/single/copmpare_rbps_tbps.png)
![plot](./images/static/single/time_sec.png)
![plot](./images/static/single/zero_rand_avg/ansible_zero_avg_cpu_ram.png)
![plot](./images/static/single/zero_rand_avg/ansible_zero_avg_net.png)
![plot](./images/static/single/zero_rand_avg/bash_zero_avg_cpu_ram.png)
![plot](./images/static/single/zero_rand_avg/bash_zero_avg_net.png)
![plot](./images/static/single/zero_rand_avg/fabric_zero_avg_cpu_ram.png)
![plot](./images/static/single/zero_rand_avg/fabric_zero_avg_net.png)

### Static multi
![plot](./images/static/multi/cpu_ram.png)
![plot](./images/static/multi/copmpare_rbps_tbps.png)
![plot](./images/static/multi/time_sec.png)

### Grafana single
![plot](./images/grafana/single/cpu_ram.png)
![plot](./images/grafana/single/copmpare_rbps_tbps.png)
![plot](./images/grafana/single/time_sec.png)
![plot](./images/grafana/single/zero_rand_avg/ansible_zero_avg_cpu_ram.png)
![plot](./images/grafana/single/zero_rand_avg/ansible_zero_avg_net.png)
![plot](./images/grafana/single/zero_rand_avg/bash_zero_avg_cpu_ram.png)
![plot](./images/grafana/single/zero_rand_avg/bash_zero_avg_net.png)
![plot](./images/grafana/single/zero_rand_avg/fabric_zero_avg_cpu_ram.png)
![plot](./images/grafana/single/zero_rand_avg/fabric_zero_avg_net.png)

### Grafana split
![plot](./images/grafana/split/cpu_ram.png)
![plot](./images/grafana/split/copmpare_rbps_tbps.png)
![plot](./images/grafana/split/time_sec.png)

### Grafana multi
![plot](./images/grafana/multi/cpu_ram.png)
![plot](./images/grafana/multi/copmpare_rbps_tbps.png)
![plot](./images/grafana/multi/time_sec.png)

### Tiquet single
![plot](./images/tiquet/single/cpu_ram.png)
![plot](./images/tiquet/single/copmpare_rbps_tbps.png)
![plot](./images/tiquet/single/time_sec.png)
![plot](./images/tiquet/single/zero_rand_avg/ansible_zero_avg_cpu_ram.png)
![plot](./images/tiquet/single/zero_rand_avg/ansible_zero_avg_net.png)
![plot](./images/tiquet/single/zero_rand_avg/bash_zero_avg_cpu_ram.png)
![plot](./images/tiquet/single/zero_rand_avg/bash_zero_avg_net.png)
![plot](./images/tiquet/single/zero_rand_avg/fabric_zero_avg_cpu_ram.png)
![plot](./images/tiquet/single/zero_rand_avg/fabric_zero_avg_net.png)

### Tiquet split
![plot](./images/tiquet/split/cpu_ram.png)
![plot](./images/tiquet/split/copmpare_rbps_tbps.png)
![plot](./images/tiquet/split/time_sec.png)

### Tiquet multi
![plot](./images/tiquet/multi/cpu_ram.png)
![plot](./images/tiquet/multi/copmpare_rbps_tbps.png)
![plot](./images/tiquet/multi/time_sec.png)
