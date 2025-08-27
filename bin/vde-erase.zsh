#/bin/zsh

# Erease associated containers
docker image ls --filter "reference=vde-*" --format '{{.ID}}' | while read -r image_id; do
    container_ids=$(docker ps -aq --filter "ancestor=$image_id")
    if [ -n "$container_ids" ]; then
        docker rm -f $container_ids
    fi
done

# Erease images
docker images --filter "reference=vde-*" --format '{{.ID}}' | while read -r image_id; do
    docker image rm -f "$image_id"
done