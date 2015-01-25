################################################################################
#
# owncloud
#
################################################################################

OWNCLOUD_VERSION = 7.0.4
OWNCLOUD_SITE = http://download.owncloud.org/community
OWNCLOUD_SOURCE = owncloud-$(OWNCLOUD_VERSION).tar.bz2
OWNCLOUD_INSTALL_STAGING = YES
OWNCLOUD_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
OWNCLOUD_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
OWNCLOUD_LICENSE = OWNCLOUD
OWNCLOUD_LICENSE_FILES = LICENSE
OWNCLOUD_DEPENDENCIES = lighttpd

define OWNCLOUD_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/var/www/owncloud
    cp -R $(@D)/* $(TARGET_DIR)/var/www/owncloud
    sed -i 's/#\(include *.*fastcgi.*\)/\1/' $(TARGET_DIR)/etc/lighttpd/modules.conf
endef
$(eval $(generic-package))
