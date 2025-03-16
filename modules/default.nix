{config, lib, pkgs, ...}:
{
imports = [
  ./audio.nix
  ./desktop.nix
  ./development.nix
  ./font.nix
  ./services.nix
  ./system.nix
];
}
