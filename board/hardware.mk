# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += $(COMMON_PATH)/cmhw

# Mediatek support
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# Backlights
TARGET_PROVIDES_LIBLIGHT := true

# Shims
TARGET_LDPRELOAD += libmtk_symbols.so

LINKER_FORCED_SHIM_LIBS := \
    /system/vendor/lib/libcam.paramsmgr.so|libshim_sony_camera.so \
    /system/vendor/lib64/libcam.paramsmgr.so|libshim_sony_camera.so
