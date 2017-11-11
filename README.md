# Runnng Apache Hadoop/Spark/other bigdata on Docker swarm

This repository contains example configuration and docker definition to run the flokkr docker images (Hadoop/Spark/Hive/...) on docker swarm cluster. 

## Getting started

After creating a docker swarm cluster (with `docker swarm init` and `docker swarm join`).

Choose a subdirectory and deploy it:

```
cd ozone
docker stack deploy -c docker-compose.yaml ozone
```

Check the stacks/services:

```
docker stack ls
docker stack ps ozone
docker service ls
```

Scale:

```
docker service scale datanode=10
```

## Attributes
| Topic                                    | Solution                                                   |
| ---------------------------------------- | ---------------------------------------------------------- |
| __Configuration management__ continue    |                                                            |
| Source of config files:                  | docker-compose file (or external env file)                 |
| Configuration preprocessing:             | converted from environment variable with envtoconf         |
| Automatic restart on config change:      | No                                                         |
| __Provisioning and scheduling__          |                                                            |
| Multihost support                        | Yes. Via Swarm networking.                                 |
| Requirements on the hosts                | Docker (with initialized swarm mode)                       |
| Definition of the containers per host    | docker-compose deployment section                          |
| Scheduling (find hosts with available resource) | docker-compose based (global/replicated)            |
| Failover on host crash                   | N/A                                                        |
| Scale up/down:                           | `docker service scale service_name=n`                      |
| Multi tenancy (multiple cluster)         | Yes (docker swarm networking)                              |
| __Network__                              |                                                            |
| Network between containers               | Host network                                               |
| DNS                                      | Partial, no reverse dns for the replicated containers.     |
| Service discovery                        | DNS based                                                  |
| Data locality                            | No                                                         |
| Availability of the ports                | Every publised port is avaiblale on ever node              |
