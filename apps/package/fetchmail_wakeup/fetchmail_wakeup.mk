################################################################################
#
# fetchmail wakeup
#
################################################################################

FETCHMAIL_WAKEUP_VERSION = HEAD
FETCHMAIL_WAKEUP_SITE = https://github.com/marschap/fetchmail_wakeup
FETCHMAIL_WAKEUP_SITE_METHOD = git
FETCHMAIL_WAKEUP_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
FETCHMAIL_WAKEUP_LICENSE = FETCHMAIL_WAKEUP
FETCHMAIL_WAKEUP_LICENSE_FILES = LICENSE
FETCHMAIL_WAKEUP_DEPENDENCIES = dovecot

$(eval $(generic-package))
