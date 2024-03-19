{config, pkgs, pkgs-unstable, ...}:

{
  nix = {
    
    nixPath = [ "nixpkgs=${pkgs.path}" "unstable=${pkgs-unstable.path}" ];

    settings = {

      substituters = [];
      trusted-public-keys = [];
      experimental-features = ["nix-command" "flakes"];

    };

    gc = {

      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";

    };

    package = pkgs.nixFlakes;

  };

  nixpkgs.config.allowUnfree = true;
}
