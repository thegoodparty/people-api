# Goodparty.org People-API

# Instructions:

Run the downloader:

```
npm run download
```

When the downloader is complete:
Run the loader:

```
npm run load
```

The downloads are tracked in the VoterFile model and their counts are verified after loading. Only newer files are loaded and appended to. Zip files are deleted and older files are also removed automatically. Any failed downloads are reported to slack.

If you need to make any changes to the schema, you simply update the `Voter.prisma` schema
and then Run the app to copy the schema to the state schemas:

```
npm run copy
```

Remember that changes to the schema will require you to run migrate and generate (see below).

# Installation:

Install dependencies:

```
npm install
```

Copy .env file and update with your DATABASE_URL and other variables.

```
cp .env.example .env
```

# Database Setup

If you choose to test with a local database.
Make sure your postgres user has sufficient permissions (for development only):

```
CREATE USER username WITH PASSWORD 'password';
GRANT ALL ON SCHEMA public TO username;
CREATE DATABASE "dbname" OWNER username;
GRANT ALL PRIVILEGES ON DATABASE "dbname" TO username;
ALTER ROLE username CREATEDB;
```

You must reload configuration on the postgres server after.

# Development:

If you alter the schema you must run migrations.

To Run migrations:

```
npx prisma migrate dev
```

Generate the schema:

```
npx prisma generate
```

## Seeding

For local development and testing, you can seed the database with fake voter data:

```
npm run seed
```

This will generate 100 fake voter records with realistic demographic data, voting history, and district information. The seeding uses the `@faker-js/faker` library to generate realistic data.

See [seed/README.md](seed/README.md) for more details on the seeding pattern and how to extend it.
