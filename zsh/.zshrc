
#
# Docker
#

# Remove all stopped containers for the specified image
docker-rm-i() {
    docker rm `docker ps -a -q --filter ancestor=$1`
}

# Remove all <none> tag images
docker-rmi-none() {
    docker rmi -f `docker images -q --filter dangling=true`
}
