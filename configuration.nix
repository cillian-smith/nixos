{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

 nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      };
};

  # Networking
  networking = {
    hostName = "nixos-laptop";
    networkmanager.enable = true;
  };

  # Time and Locale
  time.timeZone = "Europe/Dublin";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IE.UTF-8";
    LC_IDENTIFICATION = "en_IE.UTF-8";
    LC_MEASUREMENT = "en_IE.UTF-8";
    LC_MONETARY = "en_IE.UTF-8";
    LC_NAME = "en_IE.UTF-8";
    LC_NUMERIC = "en_IE.UTF-8";
    LC_PAPER = "en_IE.UTF-8";
    LC_TELEPHONE = "en_IE.UTF-8";
    LC_TIME = "en_IE.UTF-8";
  };

  # Console configuration
  console.keyMap = "uk";

  # User configuration
  users.users.smithc = {
    isNormalUser = true;
    description = "Cillian Smith";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      neovim
    ];
  };
  programs.zsh.enable = true;

  # Printing
  services.printing.enable = true;

  system.stateVersion = "24.11";
}
