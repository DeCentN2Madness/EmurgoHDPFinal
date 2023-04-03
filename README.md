# Emurgo Haskell Developer Professional Final Project

My entry for the Emurgo HDP program is a 2D game using the Haskell Gloss library to render graphics.

## development environment setup with Nix & Direnv

I've pinned `direnv` (within `.envrc`) and `nixpkgs` (within both `flake.nix` and `shell.nix`) to their latest relevant commits as of April 1, 2023.

This should provide a no-hassle development environment setup no matter _when_ you attempt to interact with this codebase—provided the GitHub URLs are still valid and you have a working installation of `nix`.

## to flake or not to flake

If you do not have flakes enabled in your nix environment, **Direnv** will utilize a `default.nix` or `shell.nix` file to load the proconfigured Haskell development environment.

## load preconfigured devenv without direnv

- With flakes enabled, use `nix develop`.
- Without flakes enabled, use `nix-shell`.
