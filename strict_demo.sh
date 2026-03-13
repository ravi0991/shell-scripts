#!/bin/bash

set -euo pipefail

echo "Testing set -u (Undefined Variables)..."
echo "$name"

echo "Testing set -e (Command Failure)..."
cd dir1

echo "Testing set -o pipefail (Piped Failure)..."
cd dir2 | touch file1
