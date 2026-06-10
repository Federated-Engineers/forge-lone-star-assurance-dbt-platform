#!/bin/bash

set -e

echo "Running DBT commands"

echo "Run all model files holding business logic and test"
dbt build --profiles-dir ./lonestar_edw --project-dir ./lonestar_edw
