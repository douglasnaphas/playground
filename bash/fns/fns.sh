#!/bin/bash

fn1() {
  N=$1
  if echo $1 | grep -q -i -e x
  then
    echo "contains x"
    return 0
  fi
  echo "does not contain x"
  return 1
}

fn2() {
  N=$1
  if echo $1 | grep -q -i -e y
  then
    echo "contains y"
  else
    echo -n
  fi
}
