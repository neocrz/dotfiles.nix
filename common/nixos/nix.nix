{config, pkgs, ...}:

{
  nix = {

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
}