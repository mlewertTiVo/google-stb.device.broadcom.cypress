# cypress variant which does not support a|b mode, therefore
# only legacy style single slot and recovery.
export LOCAL_DEVICE_FORCED_NAB := y
include device/broadcom/cypress/cypress.mk

PRODUCT_NAME                   := cypress_nab
PRODUCT_MODEL                  := cypress
PRODUCT_BRAND                  := broadcom
PRODUCT_DEVICE                 := cypress
