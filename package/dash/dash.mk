#############################################################
#
# dash
#
#############################################################

DASH_VERSION = 0.5.7
DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
DASH_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
DASH_CONF_OPT:=--disable-static
DASH_PATCH = dash_$(DASH_VERSION)-2.diff.gz

$(call BUILD_AFTER_BUSYBOX,dash)

define DASH_INSTALL_TARGET_CMDS
	cp -a $(@D)/src/dash $(TARGET_DIR)/bin/dash
endef

define DASH_CLEAN_CMDS
	$(MAKE) -C $(@D) clean
	rm -f $(TARGET_DIR)/bin/dash
endef

$(eval $(call AUTOTARGETS))
