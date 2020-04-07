# lede-builder

基于 docker 编译 openwrt lede 路由器固件

## Usage

把 lede 和 lede-builder 代码拉到本地

```bash
git clone git@github.com:coolsnowwolf/lede.git
git clone git@github.com:tvrcgo/lede-builder.git
```

编辑 lede-builder 中的 .env 文件，将环境变量 LEDE_HOME 更新为本地 lede 仓库绝对路径

```bash
LEDE_HOME=/path/to/lede/repository
```

编译 docker 镜像并运行容器编译固件

```bash
cd /lede-builder
docker-compose up --build
```

二次编译

```bash
cd /lede-builder
docker-compose up
```

编译完成后输出到 ${LEDE_HOME}/bin/targets

## FAQ

#### 安装 docker-compose

看[这里](https://docs.docker.com/compose/install/)

#### lede 源码目录挂不到容器上

用 docker-compose up 执行编译，否则需要自己指定 volumes，将本地的 lede 仓库目录映射到容器的 /lede 目录
