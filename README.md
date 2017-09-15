# docker_compose
This repository contains ready to run docker compose v3 files. The list will be updated from time to time.

*You can run all instances on the same machine with the current files.
Please make sure to add placement constraints when use it on a real production environment.*

# Available: 
1. Consul cluster
2. Mongo replica set

# Consul Cluster:
This cluster is defined from 5 consul nodes (1 primary and replica of 4 secondaries) and 1 client to access the UI.
The reason I add the client is to avoid port colitions when running the full replica on the same host.

*This docker compose script will persist the data of the primary node only*

# Mongo Replica Set:
This replica is defined from 3 nodes while one node is arbiter.
There is another short live container that configure all nodes using "startup.sh" if you receive any errors please make sure
to edit the file using notepad++ -> edit -> EOL Convertion -> Unix (LF). It should convert the file and fix the carriage return.
