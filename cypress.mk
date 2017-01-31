# mandatory device configuration.
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97271
export BCHP_VER                  := A0
export PLATFORM                  := 97271
export ANDROID_PRODUCT_OUT       := cypress

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.cypress.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.cypress.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypress.rc
LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.verity.squashfs.ab-update:root/fstab.cypress

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_codecs_performance_no_enc.xml:system/etc/media_codecs_performance.xml

# common to all cypress devices.
include device/broadcom/cypress/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=512m@1528m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=728m@800m

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
PRODUCT_NAME                     := cypress
PRODUCT_MODEL                    := cypress
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := cypress

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=cypress
PRODUCT_PROPERTY_OVERRIDES    += ro.product.board=cypress


