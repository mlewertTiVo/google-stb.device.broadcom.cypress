# mandatory device configuration.
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97271
export BCHP_VER                  := A0
export PLATFORM                  := 97271
export ANDROID_PRODUCT_OUT       := cypress

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.cypress.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.nx.rc:root/init.nx.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.cypress.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.fs.verity.rc:root/init.fs.rc  # verity
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.eth.eth0.rc:root/init.eth.rc   # uses 'eth0'
LOCAL_DEVICE_RCS                 += device/broadcom/cypress/rcs/init.block.rc:root/init.block.rc   # block devices
LOCAL_DEVICE_RCS                 += device/broadcom/cypress/rcs/init.bcm.usb.rc:root/init.bcm.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RCS

LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.cypress.rc
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/cypress/rcs/init.block.rc:root/init.recovery.block.rc   # block devices
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/cypress/rcs/init.recovery.usb.rc:root/init.recovery.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RECOVERY_RCS

LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.verity.squashfs.ab-update:root/fstab.bcm
LOCAL_DEVICE_FSTAB               += device/broadcom/common/fstab/fstab.verity.squashfs.ab-update:root/fstab.cypress
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.squashfs/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_profiles.xml:system/etc/media_profiles.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_codecs_performance_no_enc.xml:system/etc/media_codecs_performance.xml
export LOCAL_DEVICE_MEDIA

# optional device override/addition.
export LOCAL_DEVICE_OVERLAY      := device/broadcom/cypress/overlay
export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/cypress/sepolicy-block
export LOCAL_DEVICE_AON_GPIO     := device/broadcom/cypress/aon_gpio.cfg:system/vendor/power/aon_gpio.cfg
export LOCAL_DEVICE_KEY_POLL     := device/broadcom/common/keylayout/gpio_keys_polled.kl:system/usr/keylayout/gpio_keys_polled_5.kl
export LOCAL_DEVICE_BT_CONFIG    := device/broadcom/cypress/bluetooth/vnd_cypress.txt
export LOCAL_DEVICE_USERDATA     := 5994691584 # ~5.58GB
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.conf
export HW_ENCODER_SUPPORT        := n
export HW_WIFI_NIC_SUPPORT       := y
export BT_RFKILL_SUPPORT         := y
export LOCAL_SYSTEMIMAGE_SQUASHFS := y
export ANDROID_ENABLE_BT         := uart
export V3D_VARIANT               := vc5
export HW_AB_UPDATE_SUPPORT      := y
export LOCAL_DEVICE_USE_VERITY   := y
export LOCAL_DEVICE_REFERENCE_BUILD := device/broadcom/cypress/reference_build.mk

# reduce nexus.ko to make room for wifi-nic.
export NEXUS_HDMI_INPUT_SUPPORT  := n
export NEXUS_FRONTEND_3158       := n
export NEXUS_FRONTEND_3461       := n
export NEXUS_FRONTEND_45216      := n
export NEXUS_FRONTEND_45308      := n

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      := mem=2048m@0m
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=512m@1528m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=760m@768m
LOCAL_DEVICE_KERNEL_CMDLINE      += ramoops.mem_address=0x7F800000 ramoops.mem_size=0x800000 ramoops.console_size=0x400000 pmem=8m@2040m
LOCAL_DEVICE_KERNEL_CMDLINE      += rootwait init=/init ro
export LOCAL_DEVICE_KERNEL_CMDLINE

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
PRODUCT_NAME                     := cypress
PRODUCT_MODEL                    := cypress
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := cypress

# additional setup per device.
ADDITIONAL_DEFAULT_PROPERTIES    += ro.hardware=cypress
ADDITIONAL_DEFAULT_PROPERTIES    += ro.product.board=cypress


