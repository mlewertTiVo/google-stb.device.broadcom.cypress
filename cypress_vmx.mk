# Enable VMX MediaCas support
export ANDROID_SUPPORTS_MEDIACAS := y
export ANDROID_ENABLE_CAS_VMX    := y

include device/broadcom/cypress/cypress.mk

PRODUCT_NAME                   := cypress_vmx
PRODUCT_MODEL                  := cypress
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := cypress

export LOCAL_DEVICE_SIGNING_PKG := cypress

# Common Verimatrix product definitions
include device/broadcom/common/cas/product_vmx.mk
