ifndef LOCAL_PRODUCT_OUT
export LOCAL_PRODUCT_OUT       := cypressd
endif
LOCAL_DEVICE_HWIMG_BOOT1         := n

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.cypressd.rc
LOCAL_DEVICE_RCS                 += device/broadcom/cypress/rcs/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypressd.rc

ifneq ($(LOCAL_DEVICE_HWIMG_BOOT1),n)
LOCAL_DEVICE_FSTAB               := device/broadcom/cypress/fstab/fstab.verity.ab-update.early.v2:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.cypressd
LOCAL_DEVICE_FSTAB               += device/broadcom/cypress/fstab/fstab.verity.ab-update.early.v2:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.bcm
else
LOCAL_DEVICE_FSTAB               := device/broadcom/cypress/fstab/fstab.verity.ab-update.early:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.cypressd
LOCAL_DEVICE_FSTAB               += device/broadcom/cypress/fstab/fstab.verity.ab-update.early:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.bcm
endif
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device, enable the secondary (reduced caps) hw decoder.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_with_pip__no_legacy_enc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/cypress/cypressd/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
export HW_HVD_REDUX              := y

export HW_AB_UPDATE_SUPPORT       := y

ifneq ($(LOCAL_DEVICE_HWIMG_BOOT1),n)
export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy-v2/block
else
export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy/block
endif
export LOCAL_DEVICE_SEPOLICY_BLOCK += device/broadcom/cypress/sepolicy/treble
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
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=768m@1232m

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
PRODUCT_PROPERTY_OVERRIDES += \
   ro.hardware=cypressd \
   \
   ro.opengles.version=196609 \
   ro.nx.mma=1 \
   \
   ro.nx.heap.video_secure=96m \
   ro.nx.heap.main=160m \
   ro.nx.heap.drv_managed=0m \
   ro.nx.heap.grow=2m \
   ro.nx.heap.shrink=2m \
   ro.nx.heap.gfx=64m \
   ro.nx.heap.export=2m \
   \
   ro.nx.capable.dtu=1 \
   ro.nx.dtu.pbuf0.addr=0x80000000 \
   ro.nx.dtu.pbuf0.size=0x17E00000 \
   ro.nx.dtu.spbuf0.addr=0x97E00000 \
   ro.nx.dtu.spbuf0.size=0x17E00000 \
   ro.nx.dtu.user.addr=0xAFC00000 \
   ro.nx.dtu.user.size=0x10400000 \
   \
   ro.nx.hwc2.tweak.fbcomp=1 \
   ro.nx.capable.cb=1 \
   ro.sf.lcd_density=320 \
   \
   ro.nx.eth.irq_mode_mask=f:c \
   \
   ro.com.google.clientidbase=android-cypress-tv \
   \
   ro.nx.trim.pip=0 \
   ro.nx.trim.pip.qr=1 \
   ro.nx.trim.mosaic=0 \
   ro.nx.trim.mtg=0 \
   ro.nx.trim.disp=0 \
   ro.nx.dolby.ms=12 \
   ro.nx.audio.clock_acc=0

TARGET_BOOTLOADER_BOARD_NAME := cypressd

# enabling dtcp
export DTCP_IP_SAGE_SUPPORT     := y
