# Copyright 2026 Bruno Marinier (bmgm41@gmail.com)
# This is free software, licensed under the GNU General Public License v2.

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
	TITLE:=Prometheus Node Exporter collector for Unbound Stats
	PKGARCH:=all
endef

define Package/$(PKG_NAME)
  $(call Package/$(PKG_NAME)/Default)
	DEPENDS:=+unbound-control +prometheus-node-exporter-lua
endef

define Package/$(PKG_NAME)/description
	Prometheus node exporter (unbound collector)
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/prometheus-collectors/
	$(INSTALL_DATA) ./files/usr/lib/lua/prometheus-collectors/unbound.lua $(1)/usr/lib/lua/prometheus-collectors/
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || /etc/init.d/prometheus-node-exporter-lua restart
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || /etc/init.d/prometheus-node-exporter-lua restart
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

#bruno
