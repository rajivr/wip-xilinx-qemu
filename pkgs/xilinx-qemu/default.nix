{ stdenv
, fetchFromGitHub
, buildPackages
, bison
, curl
, flex
, glib
, gnutls
, libgcrypt
, lzo
, ncurses
, nettle
, perl
, pixman
, pkgconfig
, python
, snappy
, texinfo
, vde2
, zlib
}:

stdenv.mkDerivation rec {
  pname = "xilinx-qemu";

  version = "2019.2";

  src = fetchFromGitHub {
    owner = "Xilinx";
    repo = "qemu";
    rev = "xilinx-v2019.2";
    sha256 = "0v0wvass7dn41dfnv95imwaszk4xdds9y1p1kavawhf225fl9509";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    (buildPackages.python.withPackages (p: [ p.libfdt ]))
    bison
    flex
    pkgconfig
    python
  ];

  buildInputs =
    [
      curl
      glib
      gnutls
      libgcrypt
      lzo
      ncurses
      nettle
      perl
      pixman
      snappy
      texinfo
      vde2
      zlib
    ];

  preConfigure = ''
    unset CPP # intereferes with dependency calculation
  '';

  configureFlags =
    [
      "--sysconfdir=/etc"
      "--localstatedir=/var"
      "--target-list=aarch64-softmmu,microblazeel-softmmu"
      "--enable-fdt"
      "--disable-kvm"
      "--disable-xen"
      "--enable-gcrypt"
    ];

  doCheck = false; # tries to access /dev

  meta = with stdenv.lib; {
    homepage = http://www.qemu.org/;
    description = "A generic and open source machine emulator and virtualizer";
    license = licenses.gpl2Plus;
  };
}
