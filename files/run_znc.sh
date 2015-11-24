#!/bin/bash
set -e

echo "starting znc on port ($PORT)"
./znc/bin/znc --no-color
