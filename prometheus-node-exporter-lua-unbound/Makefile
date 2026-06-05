#
# Copyright (C) 2013-2017 OpenWrt.org
#
include $(TOPDIR)/rules.mk

PKG_NAME:=prometheus-node-exporter-lua-unbound
PKG_VERSION:=2.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Bruno Marinier <bmgm41@gmail.com>
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

Build/Compile=

define Package/$(PKG_NAME)/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Prometheus node exporter for Unbound stats
  PKGARCH:=all
endef

define Package/$(PKG_NAME)
  $(call Package/$(PKG_NAME)/Default)
  DEPENDS:=+unbound-control +prometheus-node-exporter-lua
endef

define Package/$(PKG_NAME)/description
  Adds a Unbound stats collector to the Prometheus node exporter.
  Refer to https://github.com/marinierb/prometheus-node-exporter-lua-unbound for configuration details.
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/prometheus-collectors
	$(INSTALL_DATA) ./files/usr/lib/lua/prometheus-collectors/unbound.lua         $(1)/usr/lib/lua/prometheus-collectors/
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || service prometheus-node-exporter-lua restart
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || service prometheus-node-exporter-lua restart
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
