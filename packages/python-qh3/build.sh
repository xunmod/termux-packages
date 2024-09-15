TERMUX_PKG_HOMEPAGE=https://github.com/jawah/qh3
TERMUX_PKG_DESCRIPTION="Lightweight QUIC and HTTP/3 implementation in Python"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@xunmod"
TERMUX_PKG_VERSION="1.0.9"
TERMUX_PKG_SRCURL=https://github.com/jawah/qh3/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=7e28cab4cf72a0fde41b8d60228d9145ffb3b9ecbf3e64f15424e0fd9c2c9448
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_PYTHON_COMMON_DEPS="wheel, maturin"

termux_step_configure() {
	termux_setup_rust
	export CARGO_BUILD_TARGET=${CARGO_TARGET_NAME}
	export PYO3_CROSS_LIB_DIR=$TERMUX_PREFIX/lib
}
