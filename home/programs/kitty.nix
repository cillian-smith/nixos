{config, lib, pkgs, ... }:
{

  programs.kitty = {
    enable = true;
    themeFile = "gruvbox-dark-hard";
    font = {
      name = "Mononoki Nerd Font";
      size = 10;
    };
    settings = {
      background_opacity = "0.90";
      confirm_os_window_close = 0;
    };
  };
}
