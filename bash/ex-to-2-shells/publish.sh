#!/usr/bin/env bash

echo "publish.sh: the var is ${THE_VAR}"
echo "publish.sh: running publish-to-s3 without explicity setting THE_VAR..."
bash publish-to-s3.sh
echo "publish.sh: running publish-to-s3 with THE_VAR set inline"
THE_VAR=${THE_VAR} bash publish-to-s3.sh
export THE_VAR
echo "publish.sh: running publish-to-s3 with THE_VAR exported"
bash publish-to-s3.sh
