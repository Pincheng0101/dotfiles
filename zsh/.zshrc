
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

# Go command
docker-go() {
    OS=$(uname)
    GOOS=$OS:l
    if [ $(uname -m) = "x86_64" ]; then
        GOARCH="amd64"
    else
        GOARCH="386"
    fi
    docker run --rm -it -v $PWD:/usr/src/myapp -w /usr/src/myapp -e GOOS=$GOOS -e GOARCH=$GOARCH golang:1.10.1-alpine3.7 go $@
}
