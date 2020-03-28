#!/usr/bin/env bash

cp-if-exists() {
  source="$1"
  dest="$2"
  echo "Copying... ${source} -> ${dest}"
  if [[ ! -d "${source}" ]]
  then
    echo "source directory ${source} does not exist, skipping"
    return
  fi
  if [[ ! -d "${dest}" ]]
  then
    echo "destination directory ${source} does not exist, skipping"
    return
  fi
  cp -rfv "${source}"/* "${dest}"/
}

cp-if-exists "$1" "$2"
echo completed
