{ stdenv }:

stdenv.mkDerivation rec {
  pname = "xilinx-qemu-zcu102-prebuilt";

  version = "2019.2";

  src = ./xilinx-zcu102-v2019.2-final.tar.gz;

  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    mkdir -p $out/share/${pname}

    cp pre-built/linux/images/bl31.elf $out/share/${pname}
    cp pre-built/linux/images/pmu_rom_qemu_sha3.elf $out/share/${pname}
    cp pre-built/linux/images/pmufw.elf $out/share/${pname}
    cp pre-built/linux/images/system.dtb $out/share/${pname}
    cp pre-built/linux/images/u-boot.elf $out/share/${pname}
    cp pre-built/linux/images/zynqmp-qemu-multiarch-arm.dtb $out/share/${pname}
    cp pre-built/linux/images/zynqmp-qemu-multiarch-pmu.dtb $out/share/${pname}
  '';

  meta = with stdenv.lib; {
    description = "Xilinx QEMU prebuilt binary blobs";
    homepage = "https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html";
    license = licenses.unfree;
  };
}
