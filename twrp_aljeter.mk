#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit AOSP product makefiles
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from aljeter device
$(call inherit-product, device/motorola/aljeter/device.mk)

PRODUCT_DEVICE := aljeter
PRODUCT_NAME := twrp_aljeter
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g(6) play
PRODUCT_MANUFACTURER := motorola
