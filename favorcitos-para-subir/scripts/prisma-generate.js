#!/usr/bin/env node
if (!process.env.DATABASE_URL) {
  process.env.DATABASE_URL = 'postgresql://dummy:dummy@localhost:5432/dummy';
}
require('child_process').execSync('prisma generate', { stdio: 'inherit' });
