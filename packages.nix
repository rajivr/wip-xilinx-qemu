{ ... }:

with import <nixpkgs> {};
{
  xilinx-qemu-zcu102-prebuilt = callPackage ./pkgs/xilinx-qemu-zcu102-prebuilt {};

  xilinx-qemu = callPackage ./pkgs/xilinx-qemu {};
}
