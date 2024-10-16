#!/bin/bash

# Function to check if gcloud is installed
check_gcloud() {
    if ! command -v gcloud &> /dev/null; then
        echo "Error: gcloud CLI is not installed. Please install it and try again."
        exit 1
    fi
}

# Function to check if user is logged in
check_gcloud_auth() {
    if ! gcloud auth list --filter=status:ACTIVE --format="value(account)" &> /dev/null; then
        echo "Error: You are not logged in to gcloud. Please run 'gcloud auth login' and try again."
        exit 1
    fi
}

# Function to list all deployed functions
list_functions() {
    echo "Listing all deployed Cloud Functions..."
    gcloud functions list --format="table(name,status,trigger,region)"
}

# Main script logic
check_gcloud
check_gcloud_auth
list_functions
