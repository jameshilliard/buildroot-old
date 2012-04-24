SAGETV_MINICLIENT_SITE=repo://vendor/sagetv/miniclient
SAGETV_MINICLIENT_DEPENDENCIES=linux bcm_nexus bcm_rockford sagetv_pullreader openssl libcurl google_swscale tiff zlib libpng libungif google_widevine


define SAGETV_MINICLIENT_BUILD_CMDS
        PULLREADER_PATH=$(STAGING_DIR)/usr/local/ \
        SWSCALE_PATH=$(STAGING_DIR)/usr/local/ \
        $(BCM_MAKE_ENV) $(MAKE) $(BCM_MAKEFLAGS) -C $(@D) -f Makefile.7425
endef

define SAGETV_MINICLIENT_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/miniclient $(TARGET_DIR)/app/client/miniclient
        $(INSTALL) -m 0755 -D package/sagetv/miniclient/S99miniclient $(TARGET_DIR)/etc/init.d/S99miniclient; \
        $(INSTALL) -D -m 0755 package/sagetv/miniclient/run-app $(TARGET_DIR)/app/client/run-app
        $(INSTALL) -D -m 0755 package/sagetv/miniclient/runminiclient $(TARGET_DIR)/app/client/runminiclient
endef

$(eval $(call GENTARGETS,package/sagetv,sagetv_miniclient))
