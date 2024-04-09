{ config, pkgs, pkgs-unstable, inputs, myconfig, system, ... }:

let
  comMod = import ../../common/home;
  wallpaper = builtins.fetchurl {
    url="https://i.redd.it/rvuqbga8l2tc1.png";
    sha256="10bpn0dm56qxaw121p7rzk4s5i512jxfw7186871df73dkamb0zy";
  };
in
{
  home.file."Pictures/wallpapers/wallpaper.png" = {
    source = wallpaper;
    recursive = true;
  };

  imports = (with comMod; [
    git
    packages
    tmux
  ]) ++ [ ];

  
  home.packages = (with pkgs; [
    vscode
    qbittorrent
    xfce.thunar
  ]) ++ (with pkgs-unstable; [
    discord
    obsidian
    openssh
    swayimg
    vlc
    telegram-desktop
  ]) ++ [];

  xdg.enable = true;

  home.username = "eee";
  home.homeDirectory = "/home/eee";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
