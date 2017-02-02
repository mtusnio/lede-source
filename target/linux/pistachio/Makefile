#
# Copyright (C) 2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=mipsel
BOARD:=pistachio
BOARDNAME:=MIPS pistachio
FEATURES:=fpu usb usbgadget squashfs targz nand ubifs
CPU_TYPE:=24kc
CPU_SUBTYPE:=24kf
MAINTAINER:=

KERNEL_PATCHVER:=4.9

include $(INCLUDE_DIR)/target.mk

KERNELNAME:=vmlinux dtbs

DEFAULT_PACKAGES += \
	kmod-ledtrig-heartbeat \
	uboot-envtools

$(eval $(call BuildTarget))
