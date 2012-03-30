BCM_MAKE_ENV=\
NEXUS_TOP=${BCM_NEXUS_DIR} \
PLATFORM=97425 \
BSEAV=${BCM_BSEAV_DIR} \
LINUX=${LINUX_DIR} \
BCHP_VER=${BR2_BRUNO_BCHP_VER} \
POWERSTANDBY_SUPPORT=n \
NEXUS_POWER_MANAGEMENT=n \
NEXUS_POWER_STANDBY=n \
PLAYBACK_IP_SUPPORT=y \
NETACCEL_SUPPORT=n \
LIVEMEDIA_SUPPORT=y \
MEDIA_AVI_SUPPORT=y \
MEDIA_ASF_SUPPORT=y \
BHDM_CEC_SUPPORT=n \
LIVE_STREAMING_SUPPORT=y \
HLS_PROTOCOL_SUPPORT=n \
V3D_SUPPORT=y \
KERNELMODE=n \
AUTO_PSI_SUPPORT=y \
SSL_SUPPORT=y \
NEXUS_MODE= \
DTCP_IP_SUPPORT=n \
DTCP_IP_HARDWARE_ENCRYPTION=n \
DTCP_IP_HARDWARE_DECRYPTION=n \
B_HAS_PLAYPUMP_IP=n \
MULTI_BUILD=y \
NEXUS_TEMP_MONITOR_SUPPORT=y \
NEXUS_POWER_MANAGEMENT=y \
MSDRM_PRDY_SUPPORT=y \
PRDY_ROBUSTNESS_ENABLE=y \
NEXUS_SECURITY_KEYLADDER_EXTENSION_INC=${BCM_NEXUS_DIR}/extensions/security/keyladder/7425/keyladder_ext.inc \
NEXUS_SECURITY_OTPMSP_EXTENSION_INC=${BCM_NEXUS_DIR}/extensions/security/otpmsp/7425/otpmsp_ext.inc \
NEXUS_SECURITY_USERCMD_EXTENSION_INC=${BCM_NEXUS_DIR}/extensions/security/usercmd/7425/usercmd_ext.inc \
BHSM_OTPMSP=OFF \
BHSM_KEYLADDER=OFF \
HSM_SOURCE_AVAILABLE=n \
BSP_M2M_EXT_KEY_IV_SUPPORT=ON \
PLAYBACKDEVICE_STAND_ALONE_APPLICATION=y \
TOOLCHAIN_ROOT=$(HOST_DIR)/usr/bin/ \
SC_PLATFORM=bcm97425nexus

ifeq ($(BR2_PACKAGE_BRUNO_DEBUG),y)
  BCM_NEXUS_SECURITY_LIB=${BCM_NEXUS_DIR}/modules/security/7425/lib/libnexus_security
  BCM_MAKE_ENV += B_REFSW_DEBUG=y
else
  BCM_NEXUS_SECURITY_LIB=${BCM_NEXUS_DIR}/modules/security/7425/lib/retail/libnexus_security
  BCM_MAKE_ENV += B_REFSW_DEBUG=n
endif

BCM_MAKE_ENV += NEXUS_EXTRALIBS=${BCM_NEXUS_SECURITY_LIB}.a

BCM_MAKEFLAGS=
BCM_MAKEFLAGS += CROSS_COMPILE="${TARGET_CROSS}"
BCM_MAKEFLAGS += LD="${TARGET_LD}"
BCM_MAKEFLAGS += PATH=${HOST_DIR}/usr/bin:${PATH}
BCM_MAKEFLAGS += PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig"
BCM_MAKEFLAGS += HOST_DIR="${HOST_DIR}"
BCM_MAKEFLAGS += APPLIBS_TOP=${BCM_APPS_DIR}

NETFLIX_MAKEFLAGS=
NETFLIX_MAKEFLAGS += CROSS_COMPILE="${TARGET_CROSS}"
NETFLIX_MAKEFLAGS += PATH=${HOST_DIR}/usr/bin:${PATH}
NETFLIX_MAKEFLAGS += PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig"

#export NETACCEL_SUPPORT=y
#export LIVEMEDIA_SUPPORT=n
#export MEDIA_ASF_SUPPORT=y
#export B_HAS_PLAYPUMP_IP=y
#export DTCP_IP_SUPPORT=y
#export DTCP_IP_HARDWARE_ENCRYPTION=y
#export DTCP_IP_HARDWARE_DECRYPTION=y
