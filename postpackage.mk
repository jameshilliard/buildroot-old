ifeq ($(BR2_PACKAGE_BRUNO),y)

define OPENSSL_BACKPORT_DIRS
	ln -sf $(OPENSSL_DIR) $(BUILD_DIR)/openssl-1.0.0d
endef

OPENSSL_POST_EXTRACT_HOOKS += OPENSSL_BACKPORT_DIRS
endif # BR2_PACKAGE_BRUNO
