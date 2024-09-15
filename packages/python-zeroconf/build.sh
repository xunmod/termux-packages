TERMUX_PKG_HOMEPAGE=https://github.com/python-zeroconf/python-zeroconf
TERMUX_PKG_DESCRIPTION="A pure python implementation of multicast DNS service discovery"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.134.0"
TERMUX_PKG_SRCURL=https://pypi.io/packages/source/z/zeroconf/zeroconf-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=5be2c3a61cc81eb1bd4684bbdee19d708522d94bc8ac60dfe001a0fde4421092
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
