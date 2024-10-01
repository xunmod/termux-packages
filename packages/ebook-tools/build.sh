# Dependency for kf6-kfilemetadata
TERMUX_PKG_HOMEPAGE='https://sourceforge.net/projects/ebook-tools/'
TERMUX_PKG_DESCRIPTION='Tools for accessing and converting various ebook file formats'
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.2.2
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/ebook-tools/ebook-tools-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=cbc35996e911144fa62925366ad6a6212d6af2588f1e39075954973bbee627ae
TERMUX_PKG_DEPENDS="convertlit, libxml2, libzip"
TERMUX_PKG_AUTO_UPDATE=true