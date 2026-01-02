# makefile for prometheus-node-exporter-lua-unbound

include $(TOPDIR)/rules.mk
PKG_NAME:=prometheus-node-exporter-lua-unbound
PKG_VERSION:=1.1.0
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Prometheus Node Exporter for Unbound Stats
  DEPENDS:=+luci-app-unbound +unbound-control +prometheus-node-exporter-lua
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
  A lua script to extract unbound stats for Prometheus Node Exporter.
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/prometheus-collectors/
	$(INSTALL_DATA) usr/lib/lua/prometheus-collectors/unbound.lua $(1)/usr/lib/lua/prometheus-collectors/
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
