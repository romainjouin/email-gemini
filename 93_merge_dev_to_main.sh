#!/bin/bash

# Function to check if there are uncommitted changes
check_uncommitted_changes() {
    if ! git diff-index --quiet HEAD --; then
        echo "Error: You have uncommitted changes. Please commit or stash them before merging."
        exit 1
    fi
}

# Function to update and merge branches
merge_dev_to_main() {
    echo "Updating local branches..."
    
    # Fetch the latest changes from remote
    git fetch origin
    
    # Switch to dev branch and update it
    echo "Updating dev branch..."
    git checkout dev
    git pull origin dev
    
    # Switch to main branch and update it
    echo "Updating main branch..."
    git checkout main
    git pull origin main
    
    # Merge dev into main
    echo "Merging dev into main..."
    if git merge dev --no-ff; then
        echo "Merge successful."
        
        # Push the merged changes to remote main
        echo "Pushing changes to remote main..."
        git push origin main
        
        echo "Merge and push completed successfully."
    else
        echo "Merge conflict occurred. Please resolve conflicts manually."
        exit 1
    fi
}

# Main script logic
check_uncommitted_changes
merge_dev_to_main
