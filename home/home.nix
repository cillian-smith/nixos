# ~/nixos/home/home.nix
{ config, pkgs, ... }:

{
  # Basic Home Manager configuration
  home.username = "smithc";
  home.homeDirectory = "/home/smithc";
  home.stateVersion = "24.11";
  
  # Enable Home Manager
  programs.home-manager.enable = true;
}

