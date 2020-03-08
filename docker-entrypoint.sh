#!/bin/sh

# Note: Make sure this file is executable by running:
# `chmod +x docker-entrypoint.sh`

# It's good practice in Bash scripts to start with `set -e ` which makes
# the script fail fast if any subsequent commands terminate with an error
# (non-zero exit status).
set -e

# Clean up the pid file.
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Replace the currently running process (this Bash script) by running the
# following program. The `$@` means all arguments that were provided to this
# Bash script
exec "$@"
