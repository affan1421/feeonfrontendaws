#!/bin/bash
set -e

# Change Working Directory
cd /home/ubuntu/server

# Start your React app (assuming it's a static build)
node --loader ts-node/esm --experimental-specifier-resolution=node /home/ubuntu/server/node_modules/.bin/vite --host

