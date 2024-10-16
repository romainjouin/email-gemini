#!/bin/bash

# Function to switch to the dev branch
switch_to_dev() {
    local dev_branch="dev"
    
    # Check if the dev branch exists
    if git show-ref --verify --quiet refs/heads/$dev_branch; then
        # If it exists, switch to it
        git checkout $dev_branch
        echo "Switched to branch '$dev_branch'"
    else
        # If it doesn't exist, create it and switch to it
        git checkout -b $dev_branch
        echo "Created and switched to new branch '$dev_branch'"
    fi
    
    # Pull the latest changes
    git pull origin $dev_branch
    echo "Pulled latest changes from origin/$dev_branch"
}

# Main script logic
switch_to_dev
