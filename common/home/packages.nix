{config, pkgs, pkgs-unstable, myconfig, inputs, system, ...}:
{
  # Common packages between home
  home.packages = 
  (with pkgs; [

    bat
    ffmpeg
    gh
    htop
    neofetch
    nix-tree

  ]) ++ (with pkgs-unstable; [

    yt-dlp  

  ]) ++ [

    inputs.nixvim.packages.${system}.default

  ];

  programs.direnv = {

    enable = true;
    enableBashIntegration = true; 
    nix-direnv.enable = true;
    
  };

}
