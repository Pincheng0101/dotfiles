
#
# Docker
#

# Remove all stopped containers for the specified image
docker-rm-i() {
    docker rm `docker ps -a -q --filter ancestor=$1`
}
