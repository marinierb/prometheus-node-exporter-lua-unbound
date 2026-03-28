# prometheus-node-exporter-lua-unbound

Add Unbound stats to **OpenWrt**'s Prometheus node exporter.

## Pre-requisites

### Packages

- luci-app-unbound
- unbound-control
- prometheus-node-exporter-lua

### Unbound config

Add the following settings (under Services → Unbound DNS → Files → Extended)
```
remote-control:
    control-enable: yes
    control-interface: /run/unbound.ctl
    control-use-cert: no
```

## Important

Version 2 is stricly for OpenWrt 25. Previous versions are for OpenWrt 24 and are frozen.

## Install

##### On OpenWrt 25

Example - for v2.0.0-r1

```bash
wget -O prometheus-node-exporter-lua-unbound.apk https://github.com/marinierb/prometheus-node-exporter-lua-unbound/releases/download/v2.0.0/prometheus-node-exporter-lua-unbound-2.0.0-r1.apk
apk add --allow-untrusted prometheus-node-exporter-lua-unbound.apk
```

##### On OpenWrt 24

```bash
wget -O prometheus-node-exporter-lua-unbound.apk https://github.com/marinierb/prometheus-node-exporter-lua-unbound/releases/download/v1.0.6/prometheus-node-exporter-lua-unbound.ipk
opkg install prometheus-node-exporter-lua-unbound.ipk
```

## Test it

    curl -s http://router:9100/metrics | grep unbound

## That's it!

Enjoy!
