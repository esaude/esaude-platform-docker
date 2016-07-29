#!/bin/node
const fs = require('fs');
const child = require('child_process');

const npm = child.exec(`npm --no-git-tag-version version ${process.argv[2]}`);

npm.stdout.pipe(process.stdout);
npm.stderr.pipe(process.stderr);

npm.on('exit', () => {
  // commit version
  const package = JSON.parse(fs.readFileSync('package.json', 'utf8'));
  const commit = child.exec(`git add package.json && git commit -m "${package.version}"`);

  commit.on('exit', () => {
    process.exit();
  });
});
