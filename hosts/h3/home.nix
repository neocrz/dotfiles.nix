{ config, pkgs, pkgs-unstable, inputs, myconfig, system, ... }:

let
  comMod = import ../../common/home;
in
{

  imports = (with comMod; [
    git
    packages
    tmux
  ]) ++ [ ];


  home.packages = (with pkgs; [
    vscode
    qbittorrent
  ]) ++ (with pkgs-unstable; [
    discord
    obsidian
    openssh
    vlc
    telegram-desktop
  ]) ++ [];

  home.username = "eee";
  home.homeDirectory = "/home/eee";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/eee/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
