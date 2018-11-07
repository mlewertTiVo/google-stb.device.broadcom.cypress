LOCAL_PATH := $(my-dir)

include $(LOCAL_PATH)/AndroidKernel.mk
include $(LOCAL_PATH)/AndroidPhony.mk

ifneq ($(BCM_DIST_BLIMG_BINS),y)
INSTALLED_RADIOIMAGE_TARGET += $(PRODUCT_OUT)/bootloader.dev.img
INSTALLED_RADIOIMAGE_TARGET += $(PRODUCT_OUT)/bootloader.prod.img
else
INSTALLED_RADIOIMAGE_TARGET += $(PRODUCT_OUT)/bootloader.img
endif

ifneq ($(BCM_DIST_BLIMG_BINS),y)
INSTALLED_RADIOIMAGE_TARGET += $(PRODUCT_OUT)/gpt.bin
endif

