#/bin/zsh

function vde-ls() {
    echo "::: Available VDE Images :::"
    docker image ls --filter "reference=vde-*"
}

function vde() {
  docker run --rm -it \
  --name "$1-container" \
  -v "$(pwd)":/app \
  "$1" \
  "${@:2}"
}
