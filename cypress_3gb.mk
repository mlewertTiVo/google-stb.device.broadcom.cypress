# cypress variant which has 3GB memory layout, consequently dtu
# cannot be enabled.
export HW_DTU_SUPPORT          := n
include device/broadcom/cypress/cypress.mk

PRODUCT_NAME                   := cypress_3gb
PRODUCT_MODEL                  := cypress
PRODUCT_BRAND                  := broadcom
PRODUCT_DEVICE                 := cypress
