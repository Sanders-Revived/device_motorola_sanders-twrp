#
# OrangeFox Recovery Project - Motorola Moto G5S Plus (sanders)
#

FDEVICE="sanders"

fox_get_target_device() {
  if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif set | grep BASH_ARGV | grep -w \"$FDEVICE\"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif echo "$0" | grep -q "$FDEVICE"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true

	# Build info & Maintainer
	export FOX_BUILD_TYPE="Unofficial"
	export FOX_MAINTAINER_PATCH_VERSION="1"
	export FOX_VARIANT="A12.1"
	export OF_MAINTAINER="Sanders-Revived"

	# Display & UI Settings (1080x1920, 16:9)
	export OF_SCREEN_H="1920"
	export OF_STATUS_H="72"
	export OF_STATUS_INDENT_LEFT="48"
	export OF_STATUS_INDENT_RIGHT="48"
	export OF_CLOCK_POS=1
	export OF_ALLOW_DISABLE_NAVBAR=0

	# Dual Flashlight Support
	export OF_FLASHLIGHT_ENABLE=1
	export OF_FL_PATH1="/sys/class/leds/led:torch_0"
	export OF_FL_PATH2="/sys/class/leds/led:torch_1"

	# Vanilla Motorola Device (Non-MIUI)
	export FOX_VANILLA_BUILD=1
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
	export OF_DISABLE_OTA_MENU=1

	# Partitions
	export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/bootdevice/by-name/recovery"
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/bootdevice/by-name/boot"
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

	# Settings and backup defaults
	export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1
	export OF_QUICK_BACKUP_LIST="/boot;/data;/system;/vendor;"

	# Size optimization for 21MB recovery partition
	export OF_USE_LZMA_COMPRESSION=1
	export FOX_DRASTIC_SIZE_REDUCTION=1
	export FOX_DELETE_AROMAFM=1
	export FOX_DELETE_MAGISK_ADDON=1
	export FOX_DELETE_INITD_ADDON=1
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi
