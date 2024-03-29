{ config, pkgs, inputs, pkgs-unstable, myconfig, system, ... }:
let 
  
  comMod = import ../../common/home;

in
{
  imports = (with comMod; [
    bash
    git
    packages
    tmux

  ]) ++ [ ];

  home.packages = 
  (with pkgs; [
    openssh
  ]) ++ (with pkgs-unstable; [

  ]) ++ [ ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  home.sessionVariables.NIX_PATH = "nixpkgs=${pkgs.path}:unstable=${pkgs-unstable.path}";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
}
