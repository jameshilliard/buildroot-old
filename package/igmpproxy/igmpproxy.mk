#
# IGMPPROXY
#

IGMPPROXY_VERSION=0.1
IGMPPROXY_SOURCE=igmpproxy-$(IGMPPROXY_VERSION).tar.gz
IGMPPROXY_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/igmpproxy/$(IGMPPROXY_VERSION)/$(IGMPPROXY_SOURCE)
IGMPPROXY_DEPENDENCIES =

$(eval $(call AUTOTARGETS))
