GOOGLE_HDHOMERUN_PLUGIN_SITE=repo://vendor/opensource/hdhomerun_plugin
GOOGLE_HDHOMERUN_PLUGIN_DEPENDENCIES=

define GOOGLE_HDHOMERUN_PLUGIN_BUILD_CMDS
        TARGET=$(TARGET_CROSS) CROSS_COMPILE=$(TARGET_CROSS) $(MAKE) -C $(@D)
endef

define GOOGLE_HDHOMERUN_PLUGIN_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/hdhr_plugin.so \
          $(TARGET_DIR)/app/sage/lib/hdhr_plugin.so
        $(INSTALL) -D -m 0755 $(@D)/libhdhomerun.so \
          $(TARGET_DIR)/app/sage/lib/libhdhomerun.so
endef

$(eval $(call GENTARGETS))
