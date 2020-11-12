# openwrt-builder

基于 docker 编译 openwrt 路由器固件

![Build firmware](https://github.com/tvrcgo/openwrt-builder/workflows/Build%20firmware/badge.svg?branch=master)

## 本地编译

运行 docker 容器编译固件

```bash
cd /openwrt-builder
docker-compose up --build
```

固件编译完成后输出到 `~/Downloads/openwrt-firmware`
