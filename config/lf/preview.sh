#!/bin/sh

bat \
	--theme="ansi-dark" \
	--wrap="never" \
	--line-range=":$2" \
	"$1"
