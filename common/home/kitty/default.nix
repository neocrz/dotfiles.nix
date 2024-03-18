{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty.conf;
  };

  home.packages = with pkgs; [
    kitty-themes #themes
    pixcat #images
    termpdfpy #pdf
  ];
}
