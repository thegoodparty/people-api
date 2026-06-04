#!/bin/sh
set -e

echo "Starting people-api container..."
echo "Environment: NODE_ENV=${NODE_ENV}"

echo "Starting the application..."
exec node -r ./dist/otel.js dist/main.js