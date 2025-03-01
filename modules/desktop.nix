{ config, pkgs, ... }:

{
  # Hyprland configuration
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # X11 and Display settings
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  # Desktop environment packages
  environment.systemPackages = with pkgs; [
    waybar
    mako
    swww
    kitty
    rofi-wayland
    brightnessctl
    networkmanagerapplet
  ];

  # Wayland/Graphics configuration
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  # XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # Fonts
 # fonts.packages = with pkgs; [
  #  (nerdfonts.override { fonts = [ "Mononoki" ]; })
   # mononoki
 # ];
  fonts.packages = with pkgs; [
  nerd-fonts.mononoki
  mononoki
];
}
