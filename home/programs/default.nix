{config, lib, pkgs,inputs,  ...}: {
  imports = [
    ./git.nix
#    ./neovim.nix
#     ./steam.ni
    ./kitty.nix
    ./starship.nix
    ./zsh.nix
  ];
}


