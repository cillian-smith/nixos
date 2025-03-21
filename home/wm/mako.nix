{config, pkgs, ...}:

{
environment.systemPackages = with pkgs; [
    mako
];

mako = {
  enable = true;
#  actions = true; 
 # anchor = "top-right";
 # background-color = "#050505BB";
 # text-color = "#FFFFFFFF";
 # padding = "10";
 # margin = "5";
 # icons = true;
 # border-radius = "10";
};


}
