# Loosely based on this tutorial: https://www.digitalocean.com/community/tutorials/how-to-create-a-cluster-of-docker-containers-with-docker-swarm-and-digitalocean-on-ubuntu-16-04#conclusion
# with some tweaks to make it working

# Creates 3 droplets with ubuntu 16.04 and Docker 19, requires a local docker-machine installation
# The droplets created are the ones with the basic 5$/month plan, 1vcpu 1g ram, and are created on 
# the fra1 server
if [ -z $DOTOKEN ]; then
    echo "DOTOKEN is undefined, please define it"
    exit 1
fi

for i in 1 2 3; do
    docker-machine create \
    --driver digitalocean \
    --digitalocean-image ubuntu-16-04-x64 \
    --digitalocean-size s-1vcpu-1gb \
    --digitalocean-region fra1 \
    --digitalocean-access-token $DOTOKEN \
    --engine-install-url "https://releases.rancher.com/install-docker/19.03.9.sh" \
    moody-node-$1
done