#!/usr/bin/env bash

echo "BASH_SOURCE[0]: ${BASH_SOURCE[0]}"
echo -n 'dirname -- ${BASH_SOURCE[0]}: ' ; dirname -- ${BASH_SOURCE[0]}
echo "realpath BASH_SOURCE[0]: $(realpath ${BASH_SOURCE[0]})"
