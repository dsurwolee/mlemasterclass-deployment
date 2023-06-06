#!/bin/bash

# Create directories for conda environment scripts
# These directories are used to store scripts that are run when conda environments are activated or deactivated
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
mkdir -p $CONDA_PREFIX/etc/conda/deactivate.d

# Define the names of the scripts to be created
# They will be stored in the directories created above
file_conda_activate="${CONDA_PREFIX}/etc/conda/activate.d/env_vars.sh"
file_conda_deactivate="${CONDA_PREFIX}/etc/conda/deactivate.d/env_vars.sh"

# Define the content of the activation script
# This script sets environment variables when the conda environment is activated
script_conda_activate='#!/bin/sh

# Project names
export PROJECT_ID=mlemasterclass-deployment
export REGION=us-central1
# Google Storage
export BUCKETNAME=mlemasterclass-deployment-bucket
export BUCKET_URI=gs://$BUCKETNAME
export MODEL_ARTIFACT_DIR=prediction-model
# Model Container Image Registry
export REPOSITORY=prediction-model-container
export IMAGE=model-api
# Vertex API Model Name
export MODEL_DISPLAY_NAME=deployment-container-api
# API Routes
export API_HTTP_PORT=8080
export API_HEALTH_ROUTE=/health
export API_PREDICT_ROUTE=/predict'

# Define the content of the deactivation script
# This script unsets (removes) the environment variables when the conda environment is deactivated
script_conda_deactivate='#!/bin/sh

unset PROJECT_ID
unset REGION
unset BUCKETNAME
unset BUCKET_URI
unset MODEL_ARTIFACT_DIR
unset REPOSITORY
unset IMAGE
unset MODEL_DISPLAY_NAME
unset API_HTTP_PORT
unset API_HEALTH_ROUTE
unset API_PREDICT_ROUTE'

# Create the activation and deactivation script and write the content to it
echo "$script_conda_activate" > $file_conda_activate
echo "$script_conda_deactivate" > $file_conda_deactivate

# Make the activation and deactivation scripts executable
chmod +x $file_conda_activate
chmod +x $file_conda_deactivate