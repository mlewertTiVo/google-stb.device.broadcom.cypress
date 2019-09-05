# enable user mode 32bit with kernel mode 64bit compatible mode.
export LOCAL_ARM_AARCH64_COMPAT_32_BIT := y

export ANDROID_SUPPORTS_WIDEVINE  := n
export ANDROID_SUPPORTS_PLAYREADY := n
export ANDROID_ENABLE_HDMI_HDCP   := n
export ANDROID_SUPPORTS_RPMB      := n
export ANDROID_SUPPORTS_MEDIACAS  := n
export ANDROID_SUPPORTS_KEYMASTER := n
export SAGE_SUPPORT               := n

include device/broadcom/cypress/cypress.mk

PRODUCT_NAME                   := cypressk64
PRODUCT_MODEL                  := cypress
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := cypress

