# lede-builder

基于 docker 编译 lede 路由器固件

![build N1](https://github.com/tvrcgo/lede-builder/workflows/build%20N1/badge.svg?branch=master)

## 本地编译

首次编译 docker 镜像并运行容器编译固件

```bash
cd /lede-builder
docker-compose up --build
```

二次编译

```bash
cd /lede-builder
docker-compose up
```

固件编译完成后输出到 `~/Downloads/openwrt-firmware`

