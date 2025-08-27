# Virtual Development Environment (VDE)

## VDE Cli
dev build
dev <DOCKER_IMAGE>

---

## Docker Core Cli
### Run Task
**Definition** 
    --rm    Automatically removes the container when it finishes its task
    -it     Enabling the interactive mode & real-time
    -v      Mounting the current working directory on actual host
**Example** 
```
    docker run --rm -it -v "$(pwd)":/app node-cli <CMD>
    docker run --rm -it -v "$(pwd)":/app -p 3000:3000 node-cli "$@"
```
### Build Image
**Example** 
```
    docker build -t <IMAGE_NAME>:<TAG> <PATH Dockerfile>
    docker build -t node-cli .
```

---

## Example
### NodeJS
**Initialising Project** 
```
    docker run --rm -it -v "$(pwd)":/app node-cli npm init -y
```
**Initialising Project** 

