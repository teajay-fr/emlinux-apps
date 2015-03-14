################################################################################
#
# mysql config
#
################################################################################

MYSQLCONFIG_VERSION = 1.0.0
MYSQLCONFIG_SITE = $(MYSQLCONFIG_PKG_DIR)/dummy
MYSQLCONFIG_SITE_METHOD = local
MYSQLCONFIG_LICENSE = MYSQLCONFIG
MYSQLCONFIG_LICENSE_FILES = LICENSE
MYSQLCONFIG_DEPENDENCIES = mysql

MYSQLCONFIG_PKG_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

define MYSQLCONFIG_INSTALL_TARGET_CMDS
    sed 's/@MYSQL_DB_PASSWORD@/$(patsubst "%",%,$(BR2_PACKAGE_MYSQLCONFIG_PASSWORD))/' $(MYSQLCONFIG_PKG_DIR)/S98mysqlinit > $(TARGET_DIR)/etc/init.d/S98mysqlinit
    rm $(TARGET_DIR)/var/tmp/mysqlinit.sql
    mkdir -p $(TARGET_DIR)/var/run/mysqld
endef
$(eval $(generic-package))
