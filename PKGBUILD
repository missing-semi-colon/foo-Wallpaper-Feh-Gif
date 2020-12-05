_cmd_name=wgif
_pkgname=foo-Wallpaper-Feh-Gif
pkgname=foo-wallpaper-feh-gif-git
pkgver=r84.af3ebc8
pkgrel=1
pkgdesc="Just a loop that sets the wallpaper to display a gif, supports transparency"
arch=(x86_64)
url="https://github.com/missing-semi-colon/"$_pkgname".git"
license=('MIT')
depends=('feh')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
}

package() {
	cd "$pkgdir"
	mkdir -p "opt"
	mkdir -p "usr/bin"

	cp -Rv "$srcdir/$_pkgname" "$pkgdir/opt/$_pkgname"
	ln -s "/opt/$_pkgname/wgif.sh" "$pkgdir/usr/bin/$_cmd_name"
}
