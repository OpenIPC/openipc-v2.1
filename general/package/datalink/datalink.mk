################################################################################
#
# datalink
#
################################################################################
DATALINK_VERSION = 
DATALINK_SITE =
DATALINK_LICENSE = GPL-2.0
FPATH = air

ifeq ($(FAMILY),hi3536dv100)
ifeq ($(RELEASE),fpv)
FPATH = gs
endif
endif

#$(info    $(FAMILY))
#$(info    $(RELEASE))
#$(info    $(FPATH))


define DATALINK_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc
	cp ../general/package/datalink/files/datalink.conf $(TARGET_DIR)/etc

	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc               
	cp ../general/package/datalink/files/$(FPATH)/telemetry.conf $(TARGET_DIR)/etc

	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
	cp ../general/package/datalink/files/S98datalink $(TARGET_DIR)/etc/init.d

	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin
	cp ../general/package/datalink/files/$(FPATH)/telemetry $(TARGET_DIR)/usr/bin

	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin
	cp ../general/package/datalink/files/tweaksys $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
