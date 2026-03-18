#!/usr/bin/env node
// Ensures DATABASE_URL exists for prisma generate (Vercel build)
if (!process.env.DATABASE_URL) {
  process.env.DATABASE_URL = 'postgresql://dummy:dummy@localhost:5432/dummy';
}
const { execSync } = require('child_process');
execSync('npx prisma generate', { stdio: 'inherit' });
execSync('npx next build', { stdio: 'inherit' });
