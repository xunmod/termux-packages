TERMUX_PKG_HOMEPAGE=https://libimobiledevice.org
TERMUX_PKG_DESCRIPTION="A socket daemon to multiplex connections from and to iOS devices"
TERMUX_PKG_LICENSE="GPL-2.0, GPL-3.0"
TERMUX_PKG_MAINTAINER="@xunmod"
_COMMIT=0cdf92d60a140659942521ec27a1d1b7e004bc03
_COMMIT_DATE=20241202
TERMUX_PKG_VERSION=1.1.1-p${_COMMIT_DATE}
TERMUX_PKG_SRCURL=git+https://github.com/libimobiledevice/usbmuxd
TERMUX_PKG_SHA256=742b20dbb49bd26388d5a5e295d7e44b8c88c759eb76bebc2274360141c1453d
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="libimobiledevice-glue, libplist, libusb"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--without-preflight
--without-systemd
"

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout $_COMMIT

	local pdate="p$(git log -1 --format=%cs | sed 's/-//g')"
	if [[ "$TERMUX_PKG_VERSION" != *"${pdate}" ]]; then
		echo -n "ERROR: The version string \"$TERMUX_PKG_VERSION\" is"
		echo -n " different from what is expected to be; should end"
		echo " with \"${pdate}\"."
		return 1
	fi

	local s=$(find . -type f ! -path '*/.git/*' -print0 | xargs -0 sha256sum | LC_ALL=C sort | sha256sum)
	if [[ "${s}" != "${TERMUX_PKG_SHA256}  "* ]]; then
		termux_error_exit "Checksum mismatch for source files."
	fi
}

termux_step_pre_configure() {
	autoreconf -fi
}
