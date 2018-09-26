# mandatory device configuration.
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97271
export BCHP_VER                  := B0
export PLATFORM                  := 97271

# binary distribution
export BCM_BINDIST_BL_ROOT       := vendor/broadcom/prebuilts/bootloaders/cypress
export BCM_BINDIST_LIBS_ROOT     := vendor/broadcom/prebuilts/nximg/4.9/cypress
export BCM_BINDIST_KNL_ROOT      := device/broadcom/cypress-kernel/4.9
export BCM_DIST_FORCED_BINDIST   := y

# compile the rc's for the device.
ifeq ($(LOCAL_DEVICE_FULL_TREBLE),y)
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.ft.mmu.nx.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.nx.rc
else
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.mmu.nx.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.nx.rc
endif
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.fs.verity.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.fs.rc     # verity
LOCAL_DEVICE_RCS                 += device/broadcom/cypress/rcs/init.block.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.block.rc     # block devices
LOCAL_DEVICE_RCS                 += device/broadcom/cypress/rcs/init.bcm.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.bcm.usb.rc # uses 'configfs'
export LOCAL_DEVICE_RCS

LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/cypress/rcs/init.block.rc:root/init.recovery.block.rc   # block devices
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/cypress/rcs/init.recovery.usb.rc:root/init.recovery.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RECOVERY_RCS

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml
export LOCAL_DEVICE_MEDIA

# optional device override/addition.
export LOCAL_DEVICE_OVERLAY      ?= device/broadcom/cypress/overlay
export LOCAL_DEVICE_AON_GPIO     ?= device/broadcom/cypress/aon_gpio.cfg:$(TARGET_COPY_OUT_VENDOR)/power/aon_gpio.cfg
export LOCAL_DEVICE_KEY_POLL     := device/broadcom/common/keylayout/gpio_keys_polled.kl:system/usr/keylayout/gpio_keys_polled.kl
export LOCAL_DEVICE_BT_CONFIG    := device/broadcom/cypress/bluetooth/vnd_cypress.txt
ifneq ($(LOCAL_DEVICE_GPT_O_LAYOUT),y)
export LOCAL_DEVICE_USERDATA     := 5368709120  # 5.0009GB.
endif
export HW_ENCODER_SUPPORT        := n
export HW_WIFI_SUPPORT           ?= y
export HW_WIFI_NIC_SUPPORT       ?= y
export BT_RFKILL_SUPPORT         := y
export ANDROID_ENABLE_BT         := uart
export V3D_VARIANT               := vc5
export LOCAL_DEVICE_REFERENCE_BUILD := device/broadcom/cypress/reference_build.mk
export BOLT_BOARD_VB             := BCM97271T
export LOCAL_DEVICE_SYSTEM_VERITY_PARTITION := /dev/block/platform/rdb/f0200200.sdhci/by-name/system
export LOCAL_DEVICE_VENDOR_VERITY_PARTITION := /dev/block/platform/rdb/f0200200.sdhci/by-name/vendor
ifeq (${LOCAL_ARM_AARCH64_COMPAT_32_BIT},y)
export LOCAL_DEVICE_BOOT         := 67108864   # 64M
endif
export LOCAL_DEVICE_PAK_BINARY_DEV  := pak.7271.zd.bin
export LOCAL_DEVICE_PAK_BINARY_PROD := pak.7271.zb.bin

# dtu enabled.
export HW_DTU_SUPPORT            ?= y

# reduce nexus.ko to make room for wifi-nic.
#
# 1) no hdmi input
#
export NEXUS_HDMI_INPUT_SUPPORT  := n
#
# 2) no front-end
#
export NEXUS_FRONTEND_3158       := n
export NEXUS_FRONTEND_3461       := n
export NEXUS_FRONTEND_45216      := n
export NEXUS_FRONTEND_45308      := n
export NEXUS_FRONTEND_45316      := n
export NEXUS_FRONTEND_3466       := n

# kernel command line.
ifeq (${LOCAL_ARM_AARCH64_COMPAT_32_BIT},y)
# TODO: figure out the ramoops hole setup.
LOCAL_DEVICE_KERNEL_CMDLINE      := mem=2048m@0m
else
LOCAL_DEVICE_KERNEL_CMDLINE      := mem=2000m@0m mem=40m@2008m
ifeq ($(HW_DTU_SUPPORT),n)
ifneq ($(LOCAL_NVI_LAYOUT),y)
# no dtu support, not nvi setup, assume a 3GB configuration.
LOCAL_DEVICE_KERNEL_CMDLINE      += mem=1024m@3072m
endif
endif
LOCAL_DEVICE_KERNEL_CMDLINE      += ramoops.mem_address=0x7D000000 ramoops.mem_size=0x800000 ramoops.console_size=0x400000
endif
LOCAL_DEVICE_KERNEL_CMDLINE      += rootwait init=/init ro
export LOCAL_DEVICE_KERNEL_CMDLINE

# Netflix support
export LOCAL_DEVICE_NRDP_MODEL_GROUP := CYPRESS
