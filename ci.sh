#!/bin/bash
#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 {build|install|pull|push}"
    exit 1
}

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    usage
fi

# Parse the subcommand
case "$1" in
    build)
        echo "Building the project..."
		docker build . -t $IMAGE_NAME
        ;;
    install)
        echo "Installing the project..."
        ;;
    pull)
        echo "Pulling the latest changes..."
		docker image pull $IMAGE_REGISTRY_PATH
        ;;
    push)
		echo "Pushing the changes..."
		docker tag $IMAGE_NAME $IMAGE_REGISTRY_PATH
		docker push $IMAGE_REGISTRY_PATH
        ;;
    *)
        usage
        ;;
esac
