#!/bin/bash

# Check if REGION is set in the environment
if [ -z "$REGION" ]; then
    echo "Error: REGION environment variable is not set."
    echo "Please set the REGION variable before running this script."
    echo "Example: export REGION=us-central1"
    exit 1
fi

gcloud functions deploy hello_get \
  --runtime python310 \
  --trigger-http \
  --allow-unauthenticated \
  --region "$REGION"

echo "Function deployed to region: $REGION"
