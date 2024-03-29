BCM_VUDU_SITE=repo://vendor/broadcom/vudu
BCM_VUDU_DEPENDENCIES=bcm_bseav bcm_magnum bcm_nexus bcm_common \
  google_hdcp libpng jpeg zlib freetype openssl expat \
  libcurl libxml2 libxslt fontconfig google_miniclient \

BCM_VUDU_CONFIGURE_CMDS=ln -sf $(@D) $(BUILD_DIR)/vudu
BCM_VUDU_INSTALL_STAGING=YES
BCM_VUDU_INSTALL_TARGET=YES

VUDU_DIR=$(@D)/vudu-sdk
VUDU_SRC=$(@D)/vudu-sdk/src/examples/bcm7231

define BCM_VUDU_BUILD_CMDS
	$(BCM_MAKE_ENV) $(MAKE) $(BCM_MAKEFLAGS) VUDU_SDK=$(VUDU_DIR) -C $(VUDU_SRC)
endef

define BCM_VUDU_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/include/vudu && \
	cp -pr $(VUDU_DIR)/include/* $(STAGING_DIR)/usr/include/vudu
	mkdir -p $(STAGING_DIR)/usr/lib/vudu && \
	cp -pr $(VUDU_DIR)/lib/* $(STAGING_DIR)/usr/lib/vudu
endef

define BCM_VUDU_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0700 $(VUDU_SRC)/vudu-bcm7231-example $(TARGET_DIR)/usr/local/bin/vudu
	$(INSTALL) -m 0700 $(VUDU_SRC)/vudu-bcm7231-multimedia-driver-test $(TARGET_DIR)/usr/local/bin/
	cp -pr $(VUDU_DIR)/lib/* $(TARGET_DIR)/usr/lib
	mkdir -p $(TARGET_DIR)/etc/cert && \
	cp -pr $(VUDU_DIR)/etc/cert/* $(TARGET_DIR)/etc/cert
endef

$(eval $(call GENTARGETS))
