#!/bin/sh

# pyeasycalc.sh
# Bash snippet to allow easy calculator usage if python is installed. 
# Why? Because nobody has time for expr weird syntax in a bind
# Version: 1.0
# Author: SavSanta (Ru Uba)

PYTHON_EXEC=$(which python)

# Makese python as a calculator. Example: calc 2*3+4/5-6
function calc() { 

if [ -z "$PYTHON_EXEC" ]
then
  echo "--$PYTHON_EXEC --"
  $PYTHON_EXEC -c "print($@)"
else
  echo "No suitable python binary found. Calculation aborted." 
fi

}


