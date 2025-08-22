{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Development tools
    git
    vscode
    docker-compose
    tldr

    # Programming languages
    python3

    # Build tools
    gcc
    gnumake
  ];

  # Docker configuration
  virtualisation.docker.enable = true;
  users.users.smithc.extraGroups = ["docker"];
}
