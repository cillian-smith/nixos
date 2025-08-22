{
  config,
  pkgs,
  ...
}: {
  # System-wide packages
  environment.systemPackages = with pkgs; [
    btop
    fastfetch
    firefox
    git
  ];

  # Program configurations
  programs = {
    firefox.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
