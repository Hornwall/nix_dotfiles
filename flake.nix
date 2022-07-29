{
  description = "Hornwall NixOS setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnFree = true;
    };

    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      hannes-nix = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./configuration.nix 
          home-manager.nixOsModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.hannes = {
              imports = [ ./home.nix ];
            };
          }
        ];
      };
    };
  };
}
