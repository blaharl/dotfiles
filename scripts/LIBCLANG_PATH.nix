{
  nixpkgs ? import <nixpkgs> { },
}:

nixpkgs.mkShell {
  LD_LIBRARY_PATH = "${nixpkgs.stdenv.cc.cc.lib}/lib";
  LIBCLANG_PATH = "${nixpkgs.llvmPackages.libclang.lib}/lib";
  packages = with nixpkgs; [
    llvmPackages_latest.lldb
    llvmPackages_latest.libllvm
    llvmPackages_latest.libcxx
    llvmPackages_latest.clang
  ];
}
