# non-vendor-image layout: there is no separate partition for vendor.img in O+.         1
export LOCAL_NVI_LAYOUT          := y
export ANDROID_PRODUCT_OUT       := cypress_nvi

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.cypress_nvi.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.cypress_nvi.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypress_nvi.rc

LOCAL_DEVICE_FSTAB               := device/broadcom/cypress/fstab/fstab.verity.ab-update.early:root/fstab.cypress_nvi
LOCAL_DEVICE_FSTAB               += device/broadcom/cypress/fstab/fstab.verity.ab-update.early:root/fstab.bcm
export LOCAL_DEVICE_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/cypress/cypress/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

export LOCAL_SYSTEMIMAGE_SQUASHFS := n
export HW_AB_UPDATE_SUPPORT      := y

export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy-block
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.nvi.conf
export LOCAL_DEVICE_USE_VERITY   := y

export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy-block
# common to all cypress devices.
include device/broadcom/cypress/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=240m@416m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=768m@1240m

# no legacy decoder (vp8, h263, mpeg4) in hardware s.2
export HW_HVD_REVISION := S
# v3d mmu available.
export HW_GPU_MMU_SUPPORT        := y

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
$(call inherit-product, build/make/target/product/product_launched_with_n.mk)
PRODUCT_NAME                     := cypress_nvi
PRODUCT_MODEL                    := cypress_nvi
PRODUCT_BRAND                    := broadcom
PRODUCT_DEVICE                   := cypress_nvi

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=cypress_nvi
PRODUCT_PROPERTY_OVERRIDES    += ro.product.board=cypress_nvi
