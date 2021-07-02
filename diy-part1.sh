#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Add helloworld :D
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> feeds.conf.default

# Add luci-theme-argon
rm -rf package/lean/luci-theme-argon 
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git  package/lean/luci-theme-argon-config
