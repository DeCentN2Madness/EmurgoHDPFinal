{
  description = "
    One Flake to rule them all,
    One Flake to find them,
    One Flake to bring them all
    and in the dorkness >>= them.
  ";

  inputs = {        # pinned to latest relevant commits as of April 1, 2023
    nixpkgs.url     = "github:NixOS/nixpkgs/3364b5b117f65fe1ce65a3cdd5612a078a3b31e3";
    flake-utils.url = "github:numtide/flake-utils/93a2b84fc4b70d9e089d029deacc3583435c2ed6";
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      haskellEnv = pkgs.haskellPackages.ghcWithPackages (hp: with hp; [
        # haskell devenv tools
        cabal-install
        haskell-language-server
        hlint
        hpack
        # project module imports
        gloss
      ]);
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          haskellEnv
        ];
        withHoogle = false;
      };
    }
  );
}
