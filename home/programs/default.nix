{config, lib, pkgs, ...}: {
  imports = [
    ./git.nix
    ./kitty.nix
    ./starship.nix
    ./zsh.nix
  ];
}


