GOOGLE_MINICLIENT_SITE=repo://vendor/sagetv/miniclient
GOOGLE_MINICLIENT_DEPENDENCIES=\
	linux \
	bcm_nexus bcm_rockford \
	google_pullreader google_swscale google_widevine google_hdcp bruno \
	openssl libcurl tiff zlib libpng libungif libprojectM libxml2 google_platform
GOOGLE_MINICLIENT_INSTALL_STAGING=YES

define GOOGLE_MINICLIENT_BUILD_CMDS
        PULLREADER_PATH=$(STAGING_DIR)/usr/local/ \
        SWSCALE_PATH=$(STAGING_DIR)/usr/local/ \
        $(BCM_MAKE_ENV) $(MAKE) $(BCM_MAKEFLAGS) -C $(@D) -f Makefile.7425 all
endef

define GOOGLE_MINICLIENT_INSTALL_STAGING_CMDS
        $(INSTALL) -D -m 0644 $(@D)/BRCM/tr135_djitter_monitoring.h $(STAGING_DIR)/usr/include/tr135_djitter_monitoring.h
        $(INSTALL) -D -m 0644 $(@D)/BRCM/tr135_tcp_monitoring.h $(STAGING_DIR)/usr/include/tr135_tcp_monitoring.h
        $(INSTALL) -D -m 0644 $(@D)/libtr135.so $(STAGING_DIR)/usr/lib/libtr135.so
        $(INSTALL) -D -m 0644 $(@D)/libmcmedia.so $(STAGING_DIR)/usr/lib/libmcmedia.so
        $(INSTALL) -D -m 0644 $(@D)/libmcutil.so $(STAGING_DIR)/usr/lib/libmcutil.so
endef

define GOOGLE_MINICLIENT_INSTALL_TARGET_CMDS
	$(BCM_MAKE_ENV) $(MAKE) $(BCM_MAKEFLAGS) -C $(@D) -f Makefile.7425 \
		DESTDIR=$(TARGET_DIR) install
        $(INSTALL) -m 0755 -D package/google/google_miniclient/S99miniclient $(TARGET_DIR)/etc/init.d/S99miniclient; \
        $(INSTALL) -D -m 0755 package/google/google_miniclient/clear-app $(TARGET_DIR)/app/client/clear-app
        $(INSTALL) -D -m 0755 package/google/google_miniclient/run-app $(TARGET_DIR)/app/client/run-app
        $(INSTALL) -D -m 0755 package/google/google_miniclient/runminiclient $(TARGET_DIR)/app/client/runminiclient
endef

$(eval $(call GENTARGETS))
