ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS),y)
include fs/ginstall/gftv/*.mk
else
include fs/ginstall/gflt/*.mk
endif
