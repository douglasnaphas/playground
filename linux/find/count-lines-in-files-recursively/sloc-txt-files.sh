#!/usr/bin/env bash

find . -name '*.txt' | sed 's/.*/"&"/' | xargs wc -l
