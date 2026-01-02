# prometheus-openwrt-unbound

Super simple way to get unbound stats from my OpenWrt router into Prometheus.

## On the router

    wget -O luci-app-connected.ipk https://github.com/marinierb/prometheus-node-exporter-lua-unbound/releases/latest/download/prometheus-node-exporter-lua-unbound.ipk
    opkg install prometheus-node-exporter-lua-unbound.ipk

## Test it

    curl -s http://router:9100/metrics | grep unbound

## Notes

> [!WARNING]
> I have commented out the metrics I don't use. Update unbound.lua to your liking.
