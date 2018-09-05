# cypress variant which does not have a vendor partition.
export LOCAL_NVI_LAYOUT := y
include device/broadcom/cypress/cypress.mk

PRODUCT_NAME                   := cypress_nvi
PRODUCT_MODEL                  := cypress
PRODUCT_BRAND                  := broadcom
PRODUCT_DEVICE                 := cypress
