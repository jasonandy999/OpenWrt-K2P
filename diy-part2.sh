  
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

sed -i '13s/40/45/g' package/diy/luci-app-dockerman/luasrc/controller/dockerman.lua

sed -i 's/44/43/g' package/lean/luci-app-usb-printer/luasrc/controller/usb_printer.lua
sed -i 's/nas/services/g' package/lean/luci-app-usb-printer/luasrc/controller/usb_printer.lua
sed -i 's/NAS/Services/g' package/lean/luci-app-usb-printer/luasrc/controller/usb_printer.lua
sed -i 's/USB 打印服务器/打印服务/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
sed -i 's/网络存储/存储/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po

sed -i '/msgid "miniDLNA"/{n;s/miniDLNA/DLNA服务/;}' feeds/luci/applications/luci-app-minidlna/po/zh-cn/minidlna.po

sed -i 's/IP\/MAC绑定/地址绑定/g' package/lean/luci-app-arpbind/po/zh-cn/arpbind.po

sed -i 's/"ZeroTier"/"内网穿透"/g' package/lean/luci-app-zerotier/luasrc/controller/zerotier.lua

sed -i 's/msgstr "诊断"/msgstr "网络诊断"/g' feeds/luci/applications/luci-app-diag-core/po/zh-cn/diag_core.po
sed -i 's/msgstr "诊断"/msgstr "网络诊断"/g' feeds/luci/applications/luci-app-mwan3/po/zh-cn/mwan3.po

sed -i 's/Lienol"/Master"/g' feeds/luci/luci.mk

sed -i '48,51d' package/default-settings/files/zzz-default-settings

sed -i 's/msgstr "Socat"/msgstr "端口转发"/g' feeds/lienol/luci-app-socat/po/zh-cn/socat.po

sed -i 's/BaiduPCS Web/百度网盘/g' package/lean/luci-app-baidupcs-web/luasrc/controller/baidupcs-web.lua
sed -i 's/services/nas/g'  `package/lean/luci-app-baidupcs-web/luasrc`

echo -e "\nmsgid \"qBittorrent\"" >> package/lean/luci-app-qbittorrent/po/zh-cn/qbittorrent.po
echo -e "msgstr \"BT  下载\"" >> package/lean/luci-app-qbittorrent/po/zh-cn/qbittorrent.po

sed -i 's/aMule设置/电驴下载/g' package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/网络存储/存储/g' package/lean/luci-app-amule/po/zh-cn/amule.po

sed -i 's/可道云/可道云盘/g' package/lean/luci-app-kodexplorer/po/zh-cn/kodexplorer.po

sed -i 's/88/89/g' package/lean/luci-app-autoreboot/luasrc/controller/autoreboot.lua

sed -i 's/90/89/g' feeds/luci/applications/luci-app-watchcat/luasrc/controller/watchcat.lua

sed -i 's/89/88/g' package/lean/luci-app-filetransfer/luasrc/controller/filetransfer.lua

sed -i 's/Turbo ACC 网络加速/网络加速/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po

sed -i 's/TTYD 终端/命令终端/g' feeds/luci/transplant/luci-app-ttyd/po/zh-cn/terminal.po

sed -i 's/解锁网易云灰色歌曲/网易音乐/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/services/vpn/g'  `grep services -rl package/lean/luci-app-unblockmusic/luasrc`

sed -i 's/上网时间控制/时间控制/g' feeds/lienol/luci-app-timecontrol/po/zh-cn/timecontrol.po

sed -i 's/Tcpdump 流量监控/流量监控/g' package/diy/luci-app-tcpdump/po/zh-cn/tcpdump.po

sed -i 's/network/control/g'  `grep network -rl package/diy/OpenAppFilter/luci-app-oaf/luasrc`

sed -i 's/network/control/g'  `package/openwrt-packages/luci-app-eqos/luasrc/controller/eqos.lua`

sed -i 's/CPU 性能优化调节/CPU 调节/g' package/lean/luci-app-cpufreq/po/zh-cn/cpufreq.po

sed -i 's/带宽监控/监控/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po

sed -i 's/services/system/g'  `grep services -rl feeds/luci/applications/luci-app-watchcat/luasrc`
sed -i '50s/WatchCat/智能重启/g' feeds/luci/applications/luci-app-watchcat/po/zh-cn/watchcat.po
sed -i '17s/Reboot on internet connection lost/互联网连接丢失时重启/g' feeds/luci/applications/luci-app-watchcat/luasrc/model/cbi/watchcat/watchcat.lua
sed -i '18s/Periodic reboot/定期重启/g' feeds/luci/applications/luci-app-watchcat/luasrc/model/cbi/watchcat/watchcat.lua

sed -i 's/services/nas/g'  `grep services -rl feeds/luci/applications/luci-app-aria2/luasrc`
sed -i 's/Aria2 配置/通用下载/g' feeds/luci/applications/luci-app-aria2/po/zh-cn/aria2.po

sed -i '/msgid "Transmission"/{n;s/Transmission/BtPt下载/;}' feeds/luci/applications/luci-app-transmission/po/zh-cn/transmission.po
sed -i 's/services/nas/g'  `grep services -rl feeds/luci/applications/luci-app-transmission/luasrc`

sed -i '/msgid "UPnP"/{n;s/UPnP/UPnP服务/;}' feeds/luci/applications/luci-app-upnp/po/zh-cn/upnp.po

sed -i '/msgid "Administration"/{n;s/管理权/权限管理/;}' feeds/luci/modules/luci-base/po/zh-cn/base.po

sed -i '/msgid "Software"/{n;s/软件包/软件管理/;}' feeds/luci/modules/luci-base/po/zh-cn/base.po

sed -i '/msgid "Startup"/{n;s/启动项/启动管理/;}' feeds/luci/modules/luci-base/po/zh-cn/base.po

sed -i '/msgid "Mount Points"/{n;s/挂载点/挂载路径/;}' feeds/luci/modules/luci-base/po/zh-cn/base.po

sed -i '/msgid "Reboot"/{n;s/重启/立即重启/;}' feeds/luci/modules/luci-base/po/zh-cn/base.po

sed -i 's/KMS 服务器/KMS 服务/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.zh-cn.po

sed -i '/msgid "Pass Wall"/{n;s/PassWall/畅游国际/;}' package/openwrt-packages/luci-app-passwall/luci-app-passwall/po/zh-cn/passwall.po
sed -i 's/services/vpn/g'  `grep services -rl package/openwrt-packages/luci-app-passwall/luci-app-passwall/luasrc`

sed -i 's/京东签到服务/京东签到/g' package/openwrt-packages/luci-app-jd-dailybonus/po/zh-cn/jd-dailybonus.po
sed -i 's/services/vpn/g'  `grep services -rl package/openwrt-packages/luci-app-jd-dailybonus/luasrc`

sed -i 's/services/vpn/g'  `grep services -rl package/openwrt-packages/luci-app-smartdns/luasrc`

sed -i 's/KoolProxyR plus+/广告过滤/g' package/openwrt-packages/luci-app-koolproxyR/files/usr/lib/lua/luci/controller/koolproxy.lua
sed -i 's/services/vpn/g'  `grep services -rl package/openwrt-packages/luci-app-koolproxyR/files/usr/lib/lua/luci`

sed -i 's/AdGuard Home/AdGuard/g' package/diy/luci-app-adguardhome/luasrc/controller/AdGuardHome.lua
sed -i 's/services/vpn/g'  `grep services -rl package/diy/luci-app-adguardhome/luasrc`

sed -i 's/广告屏蔽大师 Plus+/广告屏蔽/g' package/lean/luci-app-adbyby-plus/po/zh-cn/adbyby.po
sed -i 's/services/vpn/g'  `grep services -rl package/lean/luci-app-adbyby-plus/luasrc`

sed -i 's/services/vpn/g'  `grep services -rl package/openwrt-packages/OpenClash/luci-app-openclash/luasrc`

sed -i 's/services/vpn/g'  `grep services -rl package/openwrt-packages/luci-app-ssr-plus/luci-app-ssr-plus/luasrc`
sed -i 's/ShadowSocksR Plus+ 设置/SSR Plus设置/g' package/openwrt-packages/luci-app-ssr-plus/luci-app-ssr-plus/po/zh-cn/ssr-plus.po
echo -e "\nmsgid \"ShadowSocksR Plus+\"" >> package/openwrt-packages/luci-app-ssr-plus/luci-app-ssr-plus/po/zh-cn/ssr-plus.po
echo -e "msgstr \"畅游国际\"" >> package/openwrt-packages/luci-app-ssr-plus/luci-app-ssr-plus/po/zh-cn/ssr-plus.po

sed -i 's/services/vpn/g'  `grep services -rl package/openwrt-packages/luci-app-serverchan/luasrc`
