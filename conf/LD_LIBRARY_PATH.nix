{ nixpkgs ? import <nixpkgs> {} }:

nixpkgs.mkShell {

  LD_LIBRARY_PATH = "${nixpkgs.stdenv.cc.cc.lib}/lib";
}
