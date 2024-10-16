gcloud functions deploy hello_get \
  --runtime python310 \  # Or your desired Python runtime
  --trigger-http \
  --allow-unauthenticated \
  --region $REGION  # Replace with your desired region (e.g., us-central1)
