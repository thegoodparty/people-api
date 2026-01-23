#!/bin/sh
set -e

echo "Starting people-api container..."
echo "Environment: NODE_ENV=${NODE_ENV}"

echo "Starting the application..."
exec DATABASE_URL="$DATABASE_URL" node dist/src/main.js