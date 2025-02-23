{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Development tools
    git
    neovim
    vscode
    docker-compose

    # Programming languages
    python3
    go

    # Build tools
    gcc
    gnumake
  ];

  # Docker configuration
  virtualisation.docker.enable = true;
  users.users.your-username.extraGroups = [ "docker" ];

}
