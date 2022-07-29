{
  description = "Hornwall NixOS setup"

  inputs {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  output = { nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnFree = true;
    };

    lib = nixpkgs.lib;
  in {
    nixosConfiguration = {
      hannes-nix = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };
  }
}
