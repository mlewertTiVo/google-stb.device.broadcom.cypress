# cypress variant which does not have a vendor partition.
export LOCAL_NVI_LAYOUT := y
export HW_DTU_SUPPORT   := n
include device/broadcom/cypress/cypress.mk

PRODUCT_NAME                   := cypress_nvi
PRODUCT_MODEL                  := cypress
PRODUCT_BRAND                  := broadcom
PRODUCT_DEVICE                 := cypress
