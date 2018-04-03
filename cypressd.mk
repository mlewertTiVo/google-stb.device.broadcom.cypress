export LOCAL_PRODUCT_OUT       := cypressd
LOCAL_DEVICE_HWIMG_BOOT1         := n
export LOCAL_DEVICE_FULL_TREBLE  := y

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.cypressd.rc
LOCAL_DEVICE_RCS                 += device/broadcom/cypress/rcs/ueventd.rc:root/ueventd.cypressd.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypressd.rc

ifneq ($(LOCAL_DEVICE_HWIMG_BOOT1),n)
LOCAL_DEVICE_FSTAB               := device/broadcom/cypress/fstab/fstab.verity.ab-update.early.v2:root/fstab.cypressd
LOCAL_DEVICE_FSTAB               += device/broadcom/cypress/fstab/fstab.verity.ab-update.early.v2:root/fstab.bcm
else
LOCAL_DEVICE_FSTAB               := device/broadcom/cypress/fstab/fstab.verity.ab-update.early:root/fstab.cypressd
LOCAL_DEVICE_FSTAB               += device/broadcom/cypress/fstab/fstab.verity.ab-update.early:root/fstab.bcm
endif
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device, enable the secondary (reduced caps) hw decoder.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_with_pip__no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/cypress/cypressd/media_codecs_performance.xml:system/etc/media_codecs_performance.xml
export HW_HVD_REDUX              := y

export LOCAL_SYSTEMIMAGE_SQUASHFS := n
export LOCAL_VENDORIMAGE_SQUASHFS := n
export HW_AB_UPDATE_SUPPORT       := y

ifneq ($(LOCAL_DEVICE_HWIMG_BOOT1),n)
export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy-v2/block
else
export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy/block
endif
ifeq ($(LOCAL_DEVICE_FULL_TREBLE),y)
export LOCAL_DEVICE_SEPOLICY_BLOCK += device/broadcom/cypress/sepolicy/treble
endif
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.o.conf
export LOCAL_DEVICE_GPT_O_LAYOUT := y
export LOCAL_DEVICE_USE_VERITY   := y

export LOCAL_DEVICE_RTS_MODE     := 6

# bootloader firmware manipulation.
export LOCAL_DEVICE_SAGE_DEV_N_PROD := y
export BOLT_IMG_SWAP_BBL            := device/broadcom/cypress/blb/zb/bbl-3.1.1-zb.bin
export BOLT_IMG_SWAP_BFW            := device/broadcom/cypress/blb/zb/bfw-4.2.5-zb.bin

# common to all cypress devices.
include device/broadcom/cypress/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=324m@350m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=768m@1240m

# no legacy decoder (vp8, h263, mpeg4) in hardware s.2
export HW_HVD_REVISION           := S
# v3d mmu available.
export HW_GPU_MMU_SUPPORT        := y
# dolby MS12 (use default variant by setting 'y').
export BDSP_MS12_SUPPORT         := y

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
$(call inherit-product, build/make/target/product/product_launched_with_n.mk)
PRODUCT_NAME                     := cypressd
PRODUCT_MODEL                    := cypressd
PRODUCT_BRAND                    := broadcom
PRODUCT_DEVICE                   := cypressd

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES   += ro.hardware=cypressd
TARGET_BOOTLOADER_BOARD_NAME := cypressd

# enabling dtcp
export DTCP_IP_SAGE_SUPPORT     := y
