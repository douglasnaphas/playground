#!/bin/bash

C=[B-DF-HJ-NP-TV-XZb-df-hj-np-tv-xz]
V=[AEIOUYaeiouy]

while read line
do
	[[ "${line}" == "===" ]] && exit 0
	for word in ${line}
	do
		echo "${word}" | sed \
			-e "s/\(${V}\)\(${C}${V}\)/\1-\2/g" \
			-e "s/\(${V}${C}\)\(${C}${V}\)/\1-\2/g" \
			-e "s/\([Qq]\)-\([Uu]\)/\1\2/g" \
			-e "s/\([TtBbCc]\)-\([Rr]\)/\1\2/g" \
			-e "s/\([Bb]\)-\([Ll]\)/\1\2/g" \
			-e "s/\([Ss]\)-\([TtLl]\)/\1\2/g" \
			-e "s/\([CcPp]\)-\([Hh]\)/\1\2/g" \
			-e "s/\(${V}\)-\(${C}[Ee]\)$/\1\2/g"
	done
done
