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

# Function to list all deployed functions with detailed information
list_functions_detailed() {
    echo "Listing all deployed Cloud Functions with detailed information..."
    functions=$(gcloud functions list --format="value(name,region)")
    
    while read -r func region; do
        echo "Function: $func"
        echo "Region: $region"
        gcloud functions describe $func --region=$region --format="yaml(httpsTrigger.url,eventTrigger.eventType,status)"
        echo "----------------------------------------"
    done <<< "$functions"
}

# Main script logic
check_gcloud
check_gcloud_auth
list_functions_detailed
