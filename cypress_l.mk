export LOCAL_PRODUCT_OUT       := cypress_l
export LOCAL_DEVICE_FULL_TREBLE  := y

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.cypress_l.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.cypress_l.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypress_l.rc

LOCAL_DEVICE_FSTAB               := device/broadcom/cypress/fstab/fstab.verity.early:root/fstab.cypress_l
LOCAL_DEVICE_FSTAB               += device/broadcom/cypress/fstab/fstab.verity.early:root/fstab.bcm
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/cypress/cypress_l/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy-v4/block
ifeq ($(LOCAL_DEVICE_FULL_TREBLE),y)
export LOCAL_DEVICE_SEPOLICY_BLOCK += device/broadcom/cypress/sepolicy-v4/treble
endif
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/default_v3.conf
export LOCAL_DEVICE_USE_VERITY   := y
export LOCAL_DEVICE_RECOVERY_LEGACY := 67108864 # 64M
export LOCAL_DEVICE_SYSTEM_LEGACY := 1602224128 # 1528M

# common to all cypress devices.
include device/broadcom/cypress/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=242m@414m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=768m@1232m

# no legacy decoder (vp8, h263, mpeg4) in hardware s.2
export HW_HVD_REVISION           := S
# v3d mmu available.
export HW_GPU_MMU_SUPPORT        := y

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
$(call inherit-product, build/make/target/product/product_launched_with_n.mk)
PRODUCT_NAME                     := cypress_l
PRODUCT_MODEL                    := cypress_l
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := cypress_l

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=cypress_l
TARGET_BOOTLOADER_BOARD_NAME := cypress_l
