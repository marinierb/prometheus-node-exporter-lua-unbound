#!/bin/bash

#### cd to github pages dist folder
cd gh-pages-dist

#### Grap package - one copy with version number and one with latest
PACKAGE=prometheus-node-exporter-lua-unbound
cp /home/bruno/OpenWrt/openwrt/bin/packages/aarch64_cortex-a53/packages/$PACKAGE-*.apk .
cp /home/bruno/OpenWrt/openwrt/bin/packages/aarch64_cortex-a53/packages/$PACKAGE-*.apk ./$PACKAGE-latest.apk

#### Generate index.html
cat >index.html <<HTML
<!DOCTYPE html>
<html>
<head><title>OpenWrt Packages</title></head>
<body>
<h1>OpenWrt Packages</h1>
<ul>
HTML
for apk in *.apk
do
    filename=$(basename "$apk")
    echo "  <li><a href=\"$filename\">$filename</a></li>" >> index.html
done
cat >> index.html << HTML
</ul>
</body>
</html>
HTML

## Publish
git add .
git commit -m "publish"
git push
