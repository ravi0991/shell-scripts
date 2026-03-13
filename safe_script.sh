#!/bin/bash

set -e

mkdir /tmp/devops-test || echo "Directory already exists"
cd /tmp/devops-test || echo "Not able to navigate to directory"
echo "hello world" > new-file.txt || echo "file not created"
