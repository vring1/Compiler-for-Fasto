#!/usr/bin/env bash

set -e # Die on first error.

base_dir="$(dirname "$0")"

# Determine location of executable. Does this work on all platforms?
if ! [ "$CALC" ]; then
    CALC="$base_dir/bin/Debug/net7.0/Calculator.dll"
    if [[ $(uname -o 2> /dev/null) = "Cygwin" ]]; then
        CALC="$(cygpath -w "CALC")"
    fi
fi

# Verify that .NET is installed.
dotnet --version &> /dev/null || (echo "Could not find dotnet" && exit 1)

dotnet $CALC "$@"
