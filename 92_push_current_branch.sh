#!/bin/bash

# Function to get the current branch name
get_current_branch() {
    git branch --show-current
}

# Function to push the current branch to remote
push_current_branch() {
    local current_branch=$(get_current_branch)
    
    echo "Current branch: $current_branch"
    
    # Check if the branch exists on the remote
    if git ls-remote --exit-code --heads origin $current_branch > /dev/null 2>&1; then
        echo "Branch '$current_branch' exists on remote. Pushing changes..."
        git push origin $current_branch
    else
        echo "Branch '$current_branch' doesn't exist on remote. Creating and pushing..."
        git push -u origin $current_branch
    fi
    
    echo "Push completed for branch '$current_branch'"
}

# Main script logic
push_current_branch
