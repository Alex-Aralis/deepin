# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qmake-utils

DESCRIPTION="Deepin File Manager"
HOMEPAGE="https://github.com/linuxdeepin/dde-file-manager"
SRC_URI="https://github.com/linuxdeepin/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/gsettings-qt
		 x11-libs/gtk+:2
		 dev-qt/qtsvg:5
		 dev-qt/qtx11extras:5
		 dev-qt/qtconcurrent:5
		 sys-auth/polkit-qt[qt5]
		 >dde-base/deepin-menu-2.90.1
		 dde-base/dde-daemon
		 app-crypt/libsecret
		 media-video/ffmpegthumbnailer
		 net-misc/socat
		 dde-base/startdde
	     "
DEPEND="${RDEPEND}
		 >=dde-base/deepin-tool-kit-0.2.0:=
	     "

src_prepare() {
		sed -i "s|dtkbase-0-2\ dtkwidget-0-2|dtkbase\ dtkwidget|g" dde-file-manager-lib/dde-file-manager-lib.pro
		sed -i "s|dtkbase-0-2\ dtkutil-0-2\ dtkwidget-0-2|dtkbase\ dtkutil\ dtkwidget|g" dde-file-manager/dde-file-manager.pro
		sed -i "s|dtkbase-0-2\ dtkutil-0-2|dtkbase\ dtkutil|g" dde-file-manager-daemon/dde-file-manager-daemon.pro
		eqmake5	PREFIX=/usr
}

src_install() {
		emake INSTALL_ROOT=${D} install
}
