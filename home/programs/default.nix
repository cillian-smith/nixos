{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
    ./neovim.nix
    ./kitty.nix
    ./starship.nix
    ./zsh.nix
  ];
}
