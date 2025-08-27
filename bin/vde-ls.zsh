#/bin/zsh

echo "::: VDE Images :::"
docker image ls --filter "reference=vde-*"

echo "\n::: VDE Containers :::"
for image in $(docker image ls --filter "reference=vde-*"); do
    docker ps -aq --filter "ancestor=$image"
    [ -z "$cids" ] || docker rm -f $cids
done
