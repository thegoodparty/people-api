#!/bin/sh
set -e

echo "Starting people-api container..."
echo "Environment: NODE_ENV=${NODE_ENV}"

echo "Starting the application..."
exec node -r ./dist/src/otel.js dist/src/main.js