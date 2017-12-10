export LOCAL_PRODUCT_OUT       := cypressd_l

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.cypressd_l.rc
LOCAL_DEVICE_RCS                 += device/broadcom/cypress/rcs/ueventd.rc:root/ueventd.cypressd_l.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypressd_l.rc

LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.default.v2:root/fstab.cypressd_l
LOCAL_DEVICE_FSTAB               += device/broadcom/common/fstab/fstab.default.v2:root/fstab.bcm
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.default/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/cypress/cypressd/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy-v3/block
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/default_v2.conf

export LOCAL_DEVICE_RTS_MODE     := 6

# common to all cypress devices.
include device/broadcom/cypress/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=786m@352m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=412m@1140m

# no legacy decoder (vp8, h263, mpeg4) in hardware s.2
export HW_HVD_REVISION := S
# v3d mmu available.
export HW_GPU_MMU_SUPPORT        := y
# dolby MS12 (use default variant by setting 'y').
export BDSP_MS12_SUPPORT         := y

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
$(call inherit-product, build/make/target/product/product_launched_with_n.mk)
PRODUCT_NAME                     := cypressd_l
PRODUCT_MODEL                    := cypressd_l
PRODUCT_BRAND                    := broadcom
PRODUCT_DEVICE                   := cypressd_l

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=cypressd_l
TARGET_BOOTLOADER_BOARD_NAME := cypressd_l

# enabling dtcp
export DTCP_IP_SAGE_SUPPORT     := y
