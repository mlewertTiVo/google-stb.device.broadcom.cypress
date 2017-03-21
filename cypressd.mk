# mandatory device configuration.
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97271
export BCHP_VER                  := B0
export PLATFORM                  := 97271
export ANDROID_PRODUCT_OUT       := cypressd

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.cypressd.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.cypressd.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypressd.rc
LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.verity.squashfs.ab-update:root/fstab.cypressd

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_codecs_performance_no_legacy_enc.xml:system/etc/media_codecs_performance.xml

# common to all cypress devices.
include device/broadcom/cypress/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=682m@1358m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=500m@800m

# no legacy decoder (vp9, h263, mpeg4) in hardware s.2
export HW_DECODER_LEGACY_SUPPORT := n
# v3d mmu available.
export HW_GPU_MMU_SUPPORT        := y
# dolby MS12 (use default variant by setting 'y').
export BDSP_MS12_SUPPORT         := y

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
PRODUCT_NAME                     := cypressd
PRODUCT_MODEL                    := cypressd
PRODUCT_BRAND                    := broadcom
PRODUCT_DEVICE                   := cypressd

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=cypressd
PRODUCT_PROPERTY_OVERRIDES    += ro.product.board=cypressd


