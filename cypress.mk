export LOCAL_PRODUCT_OUT       := cypress
export LOCAL_DEVICE_FULL_TREBLE  := y

# compile the rc's for the device.
ifeq ($(LOCAL_DEVICE_FULL_TREBLE),y)
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.ft.rc:root/init.cypress.rc
else
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.cypress.rc
endif
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.cypress.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypress.rc

LOCAL_DEVICE_FSTAB               := device/broadcom/cypress/fstab/fstab.verity.ab-update.early:root/fstab.cypress
LOCAL_DEVICE_FSTAB               += device/broadcom/cypress/fstab/fstab.verity.ab-update.early:root/fstab.bcm
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/cypress/cypress/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

export LOCAL_SYSTEMIMAGE_SQUASHFS := n
export LOCAL_VENDORIMAGE_SQUASHFS := n
export HW_AB_UPDATE_SUPPORT      := y

export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy/block
ifeq ($(LOCAL_DEVICE_FULL_TREBLE),y)
export LOCAL_DEVICE_SEPOLICY_BLOCK += device/broadcom/cypress/sepolicy/treble
endif
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.o.conf
export LOCAL_DEVICE_GPT_O_LAYOUT := y
export LOCAL_DEVICE_USE_VERITY   := y

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
PRODUCT_NAME                     := cypress
PRODUCT_MODEL                    := cypress
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := cypress

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=cypress
TARGET_BOOTLOADER_BOARD_NAME := cypress
