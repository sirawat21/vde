#/bin/zsh

function vde-ls() {
    echo "::: Available VDE Images :::"
    docker image ls --filter "reference=vde-*"
}

# VDE runner function
function vde() {
    # Local variables
    local name=""
    local option=""
    local command=""

    # Interating check cli arguments
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -n|--name)
        # Check if the next argument exists for the name
        if [[ -z "$2" ]]; then
          echo "Error: --name requires a value."
          return 1
        fi
        name="$2"
        shift 2
        ;;
      -o|--option)
        # Check if the next argument exists for the option
        if [[ -z "$2" ]]; then
          echo "Error: --option requires a value."
          return 1
        fi
        option="$2"
        shift 2
        ;;
      -c|--command)
        # Check if the next argument exists for the command
        if [[ -z "$2" ]]; then
          echo "Error: --command requires a value."
          return 1
        fi
        command="$2"
        shift 2
        ;;
      -*)
        # Handle unknown flags
        echo "Error: Unknown flag: $1"
        return 1
        ;;
      *)
        # Stop parsing when the first non-flag argument is found
        # In this example, we expect the image name to be a non-flag.
        # This is commented out for this example since we are using flags for all params
        # break
        echo "Error: Unexpected argument $1"
        return 1
        ;;
    esac
  done

  # Validate that required arguments are present
  if [[ -z "$name" || -z "$command" ]]; then
    echo "Usage: vde -n <name> -c <command> [-o <option>]"
    return 1
  fi

  # Now you can use the parsed variables
  echo "--- VDE Function Called ---"
  echo "Name:    ${name}"
  echo "Option:  ${option:-No option provided}" # The :- provides a default value
  echo "Command: ${command}"
  echo "---------------------------"

  # Example Docker command using the parsed variables
  docker run \
    --rm -it \
    --name "${name}-container" \
    -v "$(pwd)":/app \
    "${name}" \
    "${command}"
}