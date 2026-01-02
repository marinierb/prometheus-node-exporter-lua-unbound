# prometheus-node-exporter-lua-unbound

Add unbound stats to OpenWrt's Prometheus node exporter.

## Pre-requisites

The router must be running **prometheus-node-exporter-lua**

    opkg install prometheus-node-exporter-lua

## Install

On the router:

    wget -O prometheus-node-exporter-lua-unbound.ipk https://github.com/marinierb/prometheus-node-exporter-lua-unbound/releases/latest/download/prometheus-node-exporter-lua-unbound.ipk
    opkg install prometheus-node-exporter-lua-unbound.ipk

## Test it

    curl -s http://router:9100/metrics | grep unbound

## That's it!

Enjoy!
