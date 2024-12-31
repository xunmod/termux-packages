TERMUX_PKG_HOMEPAGE=https://github.com/python-zeroconf/python-zeroconf
TERMUX_PKG_DESCRIPTION="A pure python implementation of multicast DNS service discovery"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@xunmod"
TERMUX_PKG_VERSION="0.136.2"
TERMUX_PKG_SRCURL=https://pypi.io/packages/source/z/zeroconf/zeroconf-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=37d223febad4569f0d14563eb8e80a9742be35d0419847b45d84c37fc4224bb4
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_PYTHON_COMMON_DEPS="wheel, setuptools, poetry-core, Cython"
TERMUX_PKG_PYTHON_TARGET_DEPS="'ifaddr>=0.1.7'"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_create_debscripts() {
	cat <<- EOF > ./postinst
	#!$TERMUX_PREFIX/bin/sh
	echo "Installing dependencies through pip..."
	pip3 install $TERMUX_PKG_PYTHON_TARGET_DEPS
	EOF
}
