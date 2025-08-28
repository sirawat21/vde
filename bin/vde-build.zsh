#/bin/zsh

DOCKER_FILE_ROOT_DIR="dockerfiles"
DOCKER_FILE_NAME="Dockerfile"

for image_path in $(find ./$DOCKER_FILE_ROOT_DIR -name $DOCKER_FILE_NAME -type f -mindepth 3 -maxdepth 3 -print); do
    image_name="vde-"$(basename "$(dirname -- "$image_path")")
    docker build --no-cache -f $image_path -t $image_name .
done
