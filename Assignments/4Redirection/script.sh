#!/bin/bash

# ANSI escape codes for red color
RED='\033[0;31m'
NC='\033[0m' # No color

echo "Standard output"
echo -e "${RED}Standard error.${NC}" >&2

echo "Script completed."
