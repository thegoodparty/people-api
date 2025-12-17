#!/bin/sh
set -e

echo "Starting people-api container..."
echo "Environment: NODE_ENV=${NODE_ENV}"
echo "Database URL configured: $(echo $DATABASE_URL | sed 's/:[^@]*@/:***@/')"

echo "Running SCHEMA migrations..."
if ! npx prisma migrate deploy --schema=prisma/migrations-schema/generated-schema.prisma; then
    echo "ERROR: Schema migrations failed"
    exit 1
fi

echo "Schema migrations completed successfully"

# Only run index migrations if SKIP_INDEX_MIGRATIONS is not set
if [ -z "$SKIP_INDEX_MIGRATIONS" ]; then
    echo "Running INDEX migrations..."
    if ! npx prisma migrate deploy --schema=prisma/migrations-indexes/generated-schema.prisma; then
        echo "ERROR: Index migrations failed"
        exit 1
    fi
    echo "Index migrations completed successfully"
else
    echo "Skipping index migrations (SKIP_INDEX_MIGRATIONS is set)"
fi

echo "All migrations completed successfully"

echo "Starting the application..."
exec node dist/src/main.js