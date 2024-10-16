#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 <branch_name>"
    echo "  or   $0 -c <new_branch_name>"
    echo
    echo "Options:"
    echo "  -c    Create a new branch and switch to it"
    echo "  -h    Display this help message"
}

# Function to switch to an existing branch
switch_branch() {
    if git show-ref --verify --quiet refs/heads/$1; then
        git checkout $1
        echo "Switched to branch '$1'"
    else
        echo "Branch '$1' does not exist."
        echo "Use -c option to create a new branch."
    fi
}

# Function to create and switch to a new branch
create_and_switch_branch() {
    git checkout -b $1
    echo "Created and switched to new branch '$1'"
}

# Main script logic
if [ $# -eq 0 ]; then
    usage
    exit 1
fi

while getopts ":c:h" opt; do
    case ${opt} in
        c )
            create_and_switch_branch $OPTARG
            exit 0
            ;;
        h )
            usage
            exit 0
            ;;
        \? )
            echo "Invalid Option: -$OPTARG" 1>&2
            usage
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

switch_branch $1
