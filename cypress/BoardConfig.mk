# do not generate vndk for nvi devices.
ifeq ($(LOCAL_NVI_LAYOUT),y)
BOARD_VNDK_RUNTIME_DISABLE := true
endif

include device/broadcom/common/BoardConfig.mk

