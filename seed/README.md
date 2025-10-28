# People API Seeding

This directory contains the seeding logic for the people-api database, using a factory pattern similar to gp-api.

## Usage

### Seed the database

```bash
npm run seed
```

This will generate and insert fake voter data into the database.

## Structure

### Factories (`factories/`)

Contains factory functions that generate fake data using `@faker-js/faker`:

- `voter.factory.ts` - Generates fake Voter records with realistic demographic and voting history data

### Seeds

- `seed.ts` - Main seed entry point that orchestrates all seeding
- `voters.ts` - Voter seeding logic that uses the voter factory

## Adding New Seeds

To add a new model seed:

1. Create a factory in `factories/` (e.g., `district.factory.ts`)
2. Create a seed file (e.g., `districts.ts`) that uses the factory
3. Import and call the seed function in `seed.ts`

## Configuration

The number of records generated can be adjusted by modifying the constants in each seed file (e.g., `NUM_VOTERS` in `voters.ts`).

## Environment Protection

Seeding is automatically disabled in `production`, `qa`, and `development` environments to prevent accidental data generation.
