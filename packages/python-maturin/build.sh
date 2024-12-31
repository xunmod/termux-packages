TERMUX_PKG_HOMEPAGE=https://github.com/PyO3/maturin
TERMUX_PKG_DESCRIPTION="Build and publish crates with pyo3, cffi and uniffi bindings as well as rust binaries as python packages"
TERMUX_PKG_LICENSE="Apache-2.0, MIT"
TERMUX_PKG_LICENSE_FILE="license-apache, license-mit"
TERMUX_PKG_MAINTAINER="@xunmod"
TERMUX_PKG_VERSION="1.8.1"
TERMUX_PKG_SRCURL=https://pypi.io/packages/source/m/maturin/maturin-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=49cd964aabf59f8b0a6969f9860d2cdf194ac331529caae14c884f5659568857
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_PYTHON_COMMON_DEPS="wheel, setuptools, setuptools-rust"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_post_configure() {
	export CARGO_BUILD_TARGET=${CARGO_TARGET_NAME}
	export PYO3_CROSS_LIB_DIR=$TERMUX_PREFIX/lib # Seem useless if build by setuptools-rust
}
