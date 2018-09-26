# cypress variant which does not have a vendor partition.
export LOCAL_NVI_LAYOUT := y
export HW_DTU_SUPPORT   := n
include device/broadcom/cypress/cypress.mk

# falback to legacy linker namespace
PRODUCT_TREBLE_LINKER_NAMESPACES_OVERRIDE := false
# do not generate a vndk
PRODUCT_USE_VNDK_OVERRIDE := false

PRODUCT_NAME                   := cypress_nvi
PRODUCT_MODEL                  := cypress
PRODUCT_BRAND                  := broadcom
PRODUCT_DEVICE                 := cypress
