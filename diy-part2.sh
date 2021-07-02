  
#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
# Change opkg source
echo "sed -i 's#https://mirrors.cloud.tencent.com/lede/snapshots#https://op.supes.top#g' /etc/opkg/distfeeds.conf" >> package/lean/default-settings/files/zzz-default-settings

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='K2P'' package/default-settings/files/zzz-default-settings

# 修改默认wifi名称ssid为iMei
sed -i 's/ssid=OpenWrt/ssid=iMei/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认wifi密码key为12345678
sed -i 's/key=password/key=12345678/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

sed -i 's/广告屏蔽大师 Plus+/广告屏蔽/g' package/lean/luci-app-adbyby-plus/po/zh-cn/adbyby.po
sed -i 's/services/vpn/g'  `grep services -rl package/lean/luci-app-adbyby-plus/luasrc`

sed -i 's/services/vpn/g'  `grep services -rl package/openwrt-packages/luci-app-ssr-plus/luci-app-ssr-plus/luasrc`
sed -i 's/ShadowSocksR Plus+ 设置/SSR Plus设置/g' package/openwrt-packages/luci-app-ssr-plus/luci-app-ssr-plus/po/zh-cn/ssr-plus.po
echo -e "\nmsgid \"ShadowSocksR Plus+\"" >> package/openwrt-packages/luci-app-ssr-plus/luci-app-ssr-plus/po/zh-cn/ssr-plus.po
echo -e "msgstr \"畅游国际\"" >> package/openwrt-packages/luci-app-ssr-plus/luci-app-ssr-plus/po/zh-cn/ssr-plus.po

sed -i 's/Turbo ACC 网络加速/网络加速/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po

sed -i 's/TTYD 终端/命令终端/g' feeds/luci/transplant/luci-app-ttyd/po/zh-cn/terminal.po

sed -i 's/Frp 内网穿透/内网穿透/g' package/lean/luci-app-frpc/po/zh-cn/frp.zh-cn.po
