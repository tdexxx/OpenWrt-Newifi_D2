#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# fw876/helloworld
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

#sed -i 's@coolsnowwolf/packages@P3TERX/packages@' feeds.conf.default

sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default

sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

#sed -i '$a src-git helloworld https://github.com/P3TERX/helloworld' feeds.conf.default

# add kenzo 源
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default


# add openclash
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
