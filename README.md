# Cluster setup
Based on this tutorial: https://www.digitalocean.com/community/tutorials/how-to-create-a-cluster-of-docker-containers-with-docker-swarm-and-digitalocean-on-ubuntu-16-04#conclusion
More info in the init-droplet.sh file

```bash
#execute on your local machine with docker machine installed and your digitalocean token
chmod +x init-droplets.sh
./init-droplets.sh
```

# Initializiation

Startup a rev proxy + load balancer for moody, download and execute:

```bash
# suppose you have a list of your machine ip in the private network inside the "node_list" file in the
#   ip1 ip2 ip3
# format
chmod +x nginx-gen.sh
nginx-gen.sh $(cat node_list)
docker build -f Dockerfile.nginx -t nginx-entry:latest .
docker run --restart always --name nginx-entry -p 80:80 -d nginx-entry:latest
```