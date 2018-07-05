export LOCAL_PRODUCT_OUT       := cypresst
export LOCAL_DEVICE_FULL_TREBLE  := y
export ANDROID_DEVICE_SUPPORTS_BP3 := y
# enable user mode 32bit with kernel mode 64bit compatible mode.
export LOCAL_ARM_AARCH64_COMPAT_32_BIT := y

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.cypresst.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypresst.rc

LOCAL_DEVICE_FSTAB               := device/broadcom/cypress/fstab/fstab.verity.ab-update.early.bp3:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.cypresst
LOCAL_DEVICE_FSTAB               += device/broadcom/cypress/fstab/fstab.verity.ab-update.early.bp3:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.bcm
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/cypress/cypress/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

export LOCAL_SYSTEMIMAGE_SQUASHFS := n
export LOCAL_VENDORIMAGE_SQUASHFS := n
export HW_AB_UPDATE_SUPPORT       := y

export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy/block
export LOCAL_DEVICE_SEPOLICY_BLOCK += device/broadcom/cypress/sepolicy/treble
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.o.tee.conf
export LOCAL_DEVICE_GPT_O_LAYOUT := y
export LOCAL_DEVICE_USE_VERITY   := y

export LOCAL_DEVICE_VENDOR_AB    := 99614720 # 95MB
export LOCAL_DEVICE_BOOT         := 67108864 # 64M

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
#$(call inherit-product, build/make/target/product/product_launched_with_o.mk)
PRODUCT_SHIPPING_API_LEVEL       := 26
PRODUCT_NAME                     := cypresst
PRODUCT_MODEL                    := cypresst
PRODUCT_BRAND                    := broadcom
PRODUCT_DEVICE                   := cypresst

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES += \
   ro.hardware=cypresst \
   \
   ro.opengles.version=196609 \
   debug.hwui.render_dirty_regions=false \
   ro.nx.mma=1 \
   \
   ro.nx.heap.video_secure=80m \
   ro.nx.heap.main=96m \
   ro.nx.heap.drv_managed=0m \
   ro.nx.heap.grow=2m \
   ro.nx.heap.shrink=2m \
   ro.nx.heap.gfx=64m \
   ro.nx.capable.dtu=1 \
   \
   ro.nx.hwc2.tweak.fbcomp=1 \
   ro.nx.capable.cb=1 \
   ro.sf.lcd_density=320 \
   \
   ro.nx.eth.irq_mode_mask=f:c \
   \
   ro.com.google.clientidbase=android-cypress-tv \
   ro.nrdp.modelgroup=CYPRESS \
   ro.nrdp.validation=ninja_5.1

TARGET_BOOTLOADER_BOARD_NAME := cypresst