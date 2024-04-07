{
  description = "My Nix/NixOS dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:neocrz/nixvim";
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs: 

  let 

    # My configurations
    myconfig = import ./myconfig.nix;
    # My hosts
    h = myconfig.hosts;
    # helper function
    genPkgs = {n, s, o ? []}: import n {
      system = s;
      config.allowUnfree = true;
      overlays = [  ] ++ o;
    }; 

  in 
  {
    nixosConfigurations = {

      ${h.h1.hostname} = 
      let

        system = h.h1.system;
        pkgs = genPkgs { n = nixpkgs; s = system; };
        pkgs-unstable = genPkgs { n = nixpkgs-unstable; s = system; };

      in
      nixpkgs.lib.nixosSystem
      {

        inherit system;
        specialArgs = {inherit pkgs pkgs-unstable inputs myconfig system;};
        modules = [
          ./hosts/h1
          inputs.home-manager.nixosModules.home-manager
        ];

      };


    };

    homeConfigurations = {

      ${ h.h3.hostname } = 
      let
        system = h.h3.system;
        pkgs = genPkgs { n = nixpkgs; s = system;};
        pkgs-unstable = genPkgs { n = nixpkgs-unstable; s = system; };
      in

      inputs.home-manager.lib.homeManagerConfiguration {

        inherit pkgs;
        extraSpecialArgs = { inherit inputs pkgs pkgs-unstable myconfig system; };
        modules = [ ./hosts/h3/home.nix ];

      };

    };

    nixOnDroidConfigurations.default = 
    let 
      system = h.h2.system;
      overlays = [ inputs.nix-on-droid.overlays.default ];
      pkgs = genPkgs {n=nixpkgs; s=system; o = overlays;};
      pkgs-unstable = genPkgs { n=nixpkgs-unstable; s=system; o = overlays;};
    in
    inputs.nix-on-droid.lib.nixOnDroidConfiguration 
    {
      inherit pkgs;
      extraSpecialArgs = {inherit pkgs pkgs-unstable inputs myconfig system;};
      modules = [
        ./hosts/h2
      ];
      home-manager-path = inputs.home-manager.outPath;
    };
  };


}
