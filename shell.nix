# pinned to latest relevant nixpkgs commit as of April 1, 2023
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/3364b5b117f65fe1ce65a3cdd5612a078a3b31e3.tar.gz") {} }:

let
  haskellEnv = pkgs.haskellPackages.ghcWithPackages (hpkgs: with hpkgs; [
    cabal-install
    haskell-language-server
    hlint
    hpack
  ]);

in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      haskellEnv
    ];

    withHoogle = false;
  }
