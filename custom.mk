CUSTOM_ROOT_DIR:= $(call my-dir)
CUSTOM_TARGET_FILES :=
CUSTOM_ALL_RELATE_FILES :=
#ENCRYPT_TOOL := $(CUSTOM_ROOT_DIR)/encrypt_custom

ifeq ($(CUSTOM_NAME), default)
exist_tmp=$(wildcard custom/$(MTK_PROJECT))
ifneq ($(exist_tmp), )
CUSTOM_NAME=$(MTK_PROJECT)
endif
endif

CUSTOM_SRC_DIR := custom/$(CUSTOM_NAME)/out

define all-makefiles-under-sky
$(shell find $(1) -name "*.mk" -and -not -name ".*")
endef
include $(call all-makefiles-under-sky,custom/$(CUSTOM_NAME))

include $(CUSTOM_ROOT_DIR)/common/logo.mk
#include $(CUSTOM_ROOT_DIR)/common/nvram/nvram.mk

CUSTOM_ALL_RELATE_FILES += $(CUSTOM_SRC_FILES) 

