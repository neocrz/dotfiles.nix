{config, pkgs, myconfig, ...}:
let 
user = myconfig.user; 
in
{
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName  = user.name;
    userEmail = user.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}