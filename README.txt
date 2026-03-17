Husk is a coffee brew assisting app that tracks past brews and bean data.
Users can use this data for finding starting-points easier or to revisit old beans with confidence.

## Installation
```bash
npm install
cd server && npm install
cd client && npm install
```

### Run in development
```bash
# from root
npm run dev
```

## Database Setup

This project uses MySQL. You will need MySQL 8.0+ installed and running locally.

### 1. Create the database and tables
```bash
mysql -u root -p < db/schema.sql
```

### 2. (Optional) Seed with sample data
```bash
mysql -u root -p < db/seed.sql
```

This populates the database with 5 sample beans, recipes, gear, and brew logs
so the app is usable immediately during development.

### 3. Configure your environment

Copy the example env file and fill in your credentials:
```bash
cp .env.example .env
```
```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=husk
```

### Resetting the database

During development you can wipe and rebuild the database at any time:
```bash
mysql -u root -p < db/schema.sql
mysql -u root -p < db/seed.sql
```

`schema.sql` drops and recreates the database from scratch, so this is safe
to run repeatedly.