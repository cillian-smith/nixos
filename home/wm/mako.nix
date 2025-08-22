{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    mako
  ];

  services.mako = {
    enable = true;
    settings = {
      actions = true;
      font = "monospace 9";
      anchor = "top-right";
      background-color = "#05050599";
      text-color = "#FFFFFFFF";
      padding = "10";
      margin = "5";
      icons = true;
      border-radius = 10;
      border-color = "#fdf4dc";
    };
  };
}
