#!/bin/bash

# exit 0 if $2 is $1 with the last character of $1 moved to the front, exit 1 otherwise

function kpd() {
	[[ ${#1} -eq ${#2} ]] || return 1
	echo "${2}" | grep 
}
