#/bin/zsh

function vde-ls() {
    echo "::: Available VDE Images :::"
    docker image ls --filter "reference=vde-*"
}

function vde() {
    docker run --rm -it \
    $1 \
    --name "$1-container" \
    -v "$(pwd)":/app \
    node-cli \
    "${@:2}"
}
