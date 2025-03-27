{config, lib, pkgs, inputs, ...}:
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
