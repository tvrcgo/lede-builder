# lede-builder

基于 docker 编译 openwrt lede 路由器固件

## Usage

把 lede 和 lede-builder 代码拉到本地

```bash
// lede
git clone git@github.com:coolsnowwolf/lede.git

// lede-builder
git clone git@github.com:tvrcgo/lede-builder.git
```

编辑 lede-builder 中的 .env 文件，将环境变量 LEDE_HOME 设为本地 lede 的绝对路径

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

固件编译完成后输出到 `$LEDE_HOME/bin/targets`

## FAQ

### 安装 docker-compose

看[这里](https://docs.docker.com/compose/install/)

### 容器中 /lede 目录为空

用 docker-compose up 执行编译，否则需要自己指定 volumes，将本机的 lede 目录挂到容器的 /lede

### OpenWrt can only be built on a case-sensitive filesystem

我是 mac 环境，在 docker 中用 ubuntu 编译，lede 目录挂到容器中。

注释掉文件 `$LEDE_HOME/include/prereq-build.mk` 中下面几行

```mk
$(eval $(call TestHostCommand,case-sensitive-fs, \
	OpenWrt can only be built on a case-sensitive filesystem, \
	rm -f $(TMP_DIR)/test.*; touch $(TMP_DIR)/test.fs; \
		test ! -f $(TMP_DIR)/test.FS))
```

### you should not run configure as root

Dockerfile 指定执行编译的用户

```docker
RUN groupadd -r ledegrp && useradd -r -g ledegrp lede
USER lede
```

