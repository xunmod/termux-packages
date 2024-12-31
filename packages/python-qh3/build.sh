TERMUX_PKG_HOMEPAGE=https://github.com/jawah/qh3
TERMUX_PKG_DESCRIPTION="Lightweight QUIC and HTTP/3 implementation in Python"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@xunmod"
TERMUX_PKG_VERSION="1.2.1"
TERMUX_PKG_SRCURL=https://pypi.io/packages/source/q/qh3/qh3-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=f20564373d085da55a089d9e642a26e3eca50a6ba47ad32b7fe3195d437a084f
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_PYTHON_COMMON_DEPS="wheel, maturin"

termux_step_configure() {
	termux_setup_cmake
	termux_setup_rust
	export ANDROID_NDK="$NDK"
	export CARGO_BUILD_TARGET=${CARGO_TARGET_NAME}
	export PYO3_CROSS_LIB_DIR=$TERMUX_PREFIX/lib
}
