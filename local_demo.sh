#!/bin/bash

# Global variable 
color="Red"

use_local() {
  local color="Green"
  echo "Inside function (local): $color"
}

use_global() {
  color="Yellow"
  echo "Inside function (global): $color"
}

# 1. Start
echo "Start: The color is $color"

# 2. Run local function
use_local
echo "After local function: The color is still $color" 

echo "---"

# 3. Run global function
use_global
echo "After global function: The color is now $color"
