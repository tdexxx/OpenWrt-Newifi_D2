#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# Modify hostname
# sed -i 's/OpenWrt/Newifi-D2/g' package/base-files/files/bin/config_generate

# Modify the version number
# sed -i "s/OpenWrt /P3TERX build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Add kernel build user
# [ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
#     echo 'CONFIG_KERNEL_BUILD_USER="P3TERX"' >>.config ||
#     sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"P3TERX"@' .config

# Add kernel build domain
# [ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
#     echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
#     sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config

#删除默认密码
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings


#设置FAT为utf8编码
find target/linux -path "target/linux/*/config-*" | xargs -i sed -i '$a CONFIG_ACPI=y\nCONFIG_X86_ACPI_CPUFREQ=y\n \
CONFIG_NR_CPUS=128\nCONFIG_FAT_DEFAULT_IOCHARSET="utf8"' {}




# 添加额外软件包 add passwall
# add kengzo 源
git clone https://github.com/kenzok8/openwrt-packages package/new/kengzo
git clone https://github.com/kenzok8/small package/new/small

#git clone https://github.com/kenzok8/small ./package/other/small
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall ./package/other/luci-app-passwall
#git clone https://github.com/kenzok8/openwrt-packages ./package/other/full
#echo "-----------------------------------------------------"
#echo
