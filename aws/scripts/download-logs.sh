#!/bin/bash

# Simple script to download ClouTrail logs from AWS S3

#Check if AWS CLI is installed
if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not be found. Please install it first."
    exit 1
fi

# Check if user is authenticated
if ! aws sts get-caller-identity &> /dev/null
then
    echo "Not authenticated with AWS. Please run 'aws configure'."
    exit 1
fi

# Variables
BUCKET=$1
PREFIX=$2
OUTPUT_DIR=$3

# Check parameters
if [ -z "$BUCKET" ] || [ -z "$PREFIX" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Usage: ./download-logs.sh BUCKET_NAME PREFIX OUTPUT_DIR"
    echo "Example: ./download-logs.sh security-monitoring-logs-123456789012 AWSLogs/123456789012/CloudTrail/LOCATION/DATE ~/logs"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Download logs from S3
echo "Downloading logs from s3://$BUCKET/$PREFIX to $OUTPUT_DIR..."
aws s3 cp s3://$BUCKET/$PREFIX $OUTPUT_DIR --recursive

# Decompress the logs
echo "Decompressing logs..."
find $OUTPUT_DIR -name '*.gz' -exec gunzip {} \;

echo "Download complete. Found $(find $OUTPUT_DIR -type f | wc -l) files."
echo "You can now import these logs into Elasticsearch."