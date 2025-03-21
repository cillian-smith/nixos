{config, pkgs, ...}:

{
home.packages = with pkgs; [
    mako
];

services.mako = {
  enable = true;
  actions = true; 
  font = "monospace 9";
  anchor = "top-right";
  backgroundColor = "#05050599";
  textColor = "#FFFFFFFF";
  padding = "10";
  margin = "5";
  icons = true;
  borderRadius = 10;
  borderColor = "#fdf4dc";
};


}
