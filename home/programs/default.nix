{config, lib, pkgs,inputs,  ...}: {
  imports = [
    ./git.nix
    ./kitty.nix
    ./starship.nix
    ./zsh.nix
  ];
}


