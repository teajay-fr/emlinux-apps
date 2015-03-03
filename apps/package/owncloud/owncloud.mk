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
OWNCLOUD_DEPENDENCIES = lighttpd mysql mysqlconfig

OWNCLOUD_PKG_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

define OWNCLOUD_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/var/www/owncloud
    cp -R $(@D)/* $(TARGET_DIR)/var/www/owncloud
    sed -i 's/#\(include *.*fastcgi.*\)/\1/' $(TARGET_DIR)/etc/lighttpd/modules.conf
     
    echo "CREATE DATABASE IF NOT EXISTS owncloud;" >> $(TARGET_DIR)/var/tmp/mysqlinit.sql
    echo "GRANT ALL PRIVILEGES ON owncloud.* TO 'owncloud'@'localhost' IDENTIFIED BY '$(BR2_PACKAGE_OWNCLOUD_DB_PASSWORD)';" >> $(TARGET_DIR)/var/tmp/mysqlinit.sql
endef
$(eval $(generic-package))
