################################################################################
#
# roundcube
#
################################################################################
ROUNDCUBE_VERSION = 1.0.4
ROUNDCUBE_SITE = https://github.com/roundcube/roundcubemail.git
ROUNDCUBE_SITE_METHOD = git
ROUNDCUBE_INSTALL_STAGING = YES
ROUNDCUBE_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
ROUNDCUBE_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
ROUNDCUBE_LICENSE = ROUNDCUBE
ROUNDCUBE_LICENSE_FILES = LICENSE

define ROUNDCUBE_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/var/www/roundcube
    cp -R $(@D)/* $(TARGET_DIR)/var/www/roundcube

    echo "CREATE DATABASE IF NOT EXISTS roundcube" >> $(TARGET_DIR)/var/tmp/mysqlinit.sql
    echo "GRANT ALL PRIVILEGES ON roundcube.* TO 'roundcube'@'localhost' IDENTIFIED BY '$(BR2_PACKAGE_ROUNDCUBE_DB_PASSWORD)';" >> $(TARGET_DIR)/var/tmp/mysqlinit.sql
endef
$(eval $(generic-package))
