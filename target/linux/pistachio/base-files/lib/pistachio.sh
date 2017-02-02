#!/bin/sh
#
# Copyright (C) 2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

PISTACHIO_BOARD_NAME=
PISTACHIO_MODEL=

pistachio_board_detect() {
	local name=$(grep "^machine" /proc/cpuinfo | sed "s/machine.*: IMG \(.*\) (\(.*\))/\1/g" | awk '{print tolower($1)}')
	local model=$(grep "^machine" /proc/cpuinfo | sed "s/machine.*: IMG \(.*\) (\(.*\))/\2/g")
	[ -z "$name" ] && name="unknown"
	[ -z "$model" ] && model="unknown"

	[ -z "$PISTACHIO_BOARD_NAME" ] && PISTACHIO_BOARD_NAME="$name"
	[ -z "$PISTACHIO_MODEL" ] && PISTACHIO_MODEL="$model"

	[ -e "/tmp/sysinfo/" ] || mkdir -p "/tmp/sysinfo/"
	echo $name > /tmp/sysinfo/board_name
	echo $model > /tmp/sysinfo/model
}

pistachio_board_model() {
	local model
	[ -f /tmp/sysinfo/model ] && model=$(cat /tmp/sysinfo/model)
	[ -z "$model" ] && model="unknown"

	echo "$model"
}

pistachio_board_name() {
	local name
	[ -f /tmp/sysinfo/board_name ] && name=$(cat /tmp/sysinfo/board_name)
	[ -z "$name" ] && name="unknown"

	echo "$name"
}
