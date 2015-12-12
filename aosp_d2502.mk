# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_KERNEL_CONFIG := yukon_wukong_defconfig

# backlight brightness below 127 is useless
# use 127-255 as brightness range.
BOARD_HAS_DIM_BACKLIGHT := true

# Include others
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)
$(call inherit-product, device/sony/yukon-common/device.mk)
$(call inherit-product, vendor/sony/wukong/wukong-vendor.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/wukong/overlay

PRODUCT_COPY_FILES += \
    device/sony/wukong_dsds/rootdir/system/usr/idc/cyttsp4_mt.idc:system/usr/idc/cyttsp4_mt.idc \
    device/sony/wukong_dsds/rootdir/system/etc/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf \
    device/sony/wukong_dsds/rootdir/system/etc/sensor_def_somc.conf:system/etc/sensor_def_somc.conf \
    device/sony/wukong_dsds/rootdir/system/etc/sensors_calib.conf:system/etc/sensors_calib.conf \
    device/sony/wukong_dsds/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/sony/wukong_dsds/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    device/sony/wukong_dsds/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/sony/wukong_dsds/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    device/sony/wukong_dsds/rootdir/system/etc/hsic.control.bt.sh:system/etc/hsic.control.bt.sh \
   device/sony/wukong_dsds/rootdir/system/etc/init.crda.sh:system/etc/init.crda.sh \
   device/sony/wukong_dsds/rootdir/system/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
   device/sony/wukong_dsds/rootdir/system/etc/qca6234-service.sh:system/etc/qca6234-service.sh \
    device/sony/wukong_dsds/rootdir/system/etc/sap.conf:system/etc/sap.conf \
    device/sony/wukong_dsds/rootdir/init.yukon.dev.rc:root/init.yukon.dev.rc \
    device/sony/wukong_dsds/rootdir/fstab.yukon:root/fstab.yukon

PRODUCT_PACKAGES += \
    keystore.msm8226

# Product attributes
PRODUCT_NAME := aosp_d2502
PRODUCT_DEVICE := wukong_dsds
PRODUCT_MODEL := Xperia C3(AOSP)
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony

PRODUCT_AAPT_CONFIG := large
PRODUCT_AAPT_PREBUILT_DPI := hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.usb.pid_suffix=1C2
