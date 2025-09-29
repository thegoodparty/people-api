#!/bin/sh
set -e

echo "Starting people-api container..."
echo "Environment: NODE_ENV=${NODE_ENV}"
echo "Database URL configured: $(echo $DATABASE_URL | sed 's/:[^@]*@/:***@/')"

echo "Running database migrations..."
if ! npx prisma migrate deploy; then
    echo "ERROR: Database migrations failed"
    exit 1
fi

echo "Migrations completed successfully"

echo "Starting the application..."
exec node dist/src/main.js