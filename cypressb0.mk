# mandatory device configuration.
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97271
export BCHP_VER                  := B0
export PLATFORM                  := 97271
export ANDROID_PRODUCT_OUT       := cypressb0

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.cypressb0.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.cypressb0.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypressb0.rc
LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.verity.squashfs.ab-update:root/fstab.cypressb0

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_codecs_performance_no_legacy_enc.xml:system/etc/media_codecs_performance.xml

# common to all cypress devices.
include device/broadcom/cypress/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=515m@1525m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=725m@800m

# enable hwc2 for gfd compression.
export HAL_HWC_VERSION           := v-2.0

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
PRODUCT_NAME                     := cypressb0
PRODUCT_MODEL                    := cypressb0
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := cypressb0

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=cypressb0
PRODUCT_PROPERTY_OVERRIDES    += ro.product.board=cypressb0


