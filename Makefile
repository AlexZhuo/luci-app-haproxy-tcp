include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-haproxy-tcp
PKG_VERSION=1.2
PKG_RELEASE:=1
PKG_MAINTAINER:=Alex Zhuo <1886090@gmail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=luci for haproxy and shadowsocks
        DEPENDS:=+haproxy
endef

define Package/$(PKG_NAME)/description
    A luci app for haproxy with shadowsocks
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
rm -rf /tmp/luci*
echo stopping haproxy
/etc/init.d/haproxy stop
/etc/init.d/haproxy disable
echo haproxy disabled
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
    $(CP) ./files/* $(1)/

endef

$(eval $(call BuildPackage,$(PKG_NAME)))
