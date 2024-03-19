{ config, lib, pkgs, inputs, pkgs-unstable, myconfig, system, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    nano # or some other editor, e.g. nano or neovim

    # Some common stuff that people expect to have
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    #man
    #gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "23.11";
  
  nix = {
    nixPath = [ "nixpkgs=${pkgs.path}" "unstable=${pkgs-unstable.path}" ];
    # Set up nix for flakes
    nix.extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Set your time zone
  time.timeZone = "America/Sao_Paulo";

  # Configure home-manager
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs pkgs pkgs-unstable myconfig system; };
  };
}
