GOOGLE_SAGESERVER_SITE = repo://vendor/google/sageserver
GOOGLE_SAGESERVER_DEPENDENCIES = google_mobile_api google_sage_analytics_plugin

define GOOGLE_SAGESERVER_BUILD_CMDS
	cd $(@D)/build/bruno/sage && \
	PATH=$(HOST_DIR)/usr/bin:$$PATH ./buildsage.sh
endef

define GOOGLE_SAGESERVER_TEST_CMDS
	cd $(@D)/build/bruno/sage && \
	PATH=$(HOST_DIR)/usr/bin:$$PATH ./rununittests.sh
endef

#TODO(apenwarr): There are probably unnecessary files included here.
#  I just wrote it to duplicate as precisely as possible the set of files
#  that were included in the earlier manually-generated tarball releases of
#  the sageserver.  I have a strong feeling there's extra cruft that
#  accumulated over time.  (For example, the fonts in two different places,
#  and the two files named [Aa]pache.jar, which contain different things
#  and so should have better names.)  I also think we're not supposed
#  to refer to build/hd300 anymore, but some of the files don't exist
#  elsewhere (yet?)
define GOOGLE_SAGESERVER_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/app/sage/STVs \
		 $(TARGET_DIR)/app/sage/images
	cp -alf	$(@D)/build/bruno/sage/jars/*.jar \
		$(@D)/build/bruno/sage/Sage.jar \
		$(@D)/build/bruno/sage/webserver/* \
		$(@D)/stvs/fonts \
		$(@D)/build/bruno/sage/Monospaced*.ttf \
		$(TARGET_DIR)/app/sage/
	rm -f	$(TARGET_DIR)/app/sage/Apache.jar \
		$(TARGET_DIR)/app/sage/Standard.jar
	cp -alf	$(@D)/stvs/FiberTV \
		$(TARGET_DIR)/app/sage/STVs/
	rm -f	$(TARGET_DIR)/app/sage/STVs/FiberTV/FiberTV7.xml
	rm -f	$(TARGET_DIR)/app/sage/STVs/FiberTV/FiberTVDark.xml
	cp -lf	$(@D)/images/SageTV/images/tvicon* \
		$(TARGET_DIR)/app/sage/images/
	cp -alf	package/google/google_sageserver/Sage.properties.defaults.* \
		package/google/google_sageserver/runsage \
		package/google/google_sageserver/runsageclient \
		$(TARGET_DIR)/app/sage/
	ln -sf	/tmp/Sage.properties.defaults \
		$(TARGET_DIR)/app/sage/Sage.properties.defaults
	ln -sf /bin/dir-monitor \
		$(TARGET_DIR)/app/sage/dir-monitor-sagetv
	$(INSTALL) -m 0755 -D package/google/google_sageserver/S95sageserver \
		$(TARGET_DIR)/etc/init.d/S95sageserver
endef

$(eval $(call GENTARGETS))
