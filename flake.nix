# sudo nixos-rebuild boot   --impure --flake . --max-jobs 1
# sudo nixos-rebuild switch --impure --flake . --max-jobs 1
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware = {
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixos-hardware,
      home-manager,
      plasma-manager,
    }@attrs:

    let
      nixosConfigurations =
        let
          system = "x86_64-linux";
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = true;
              packageOverrides = pkgs: {
                fahclient = pkgs.callPackage ./common/overrides/fahclient.nix { };
              };
            };
          };
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config = {
              allowUnfree = true;
            };
          };
          home-manager-prefs = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
          };
        in
        {
          apple-macbook-pro-14-1 = nixpkgs.lib.nixosSystem {
            inherit system pkgs;
            modules = [
              ./common/desktop.nix
              ./common/system.nix
              #./common/nfs.nix
              ./machines/apple-macbook-pro-14-1
              ./users/john
              { nix.registry.nixpkgs.flake = nixpkgs; } # For "nix shell"
              home-manager.nixosModules.home-manager
              home-manager-prefs
              nixos-hardware.nixosModules.apple-macbook-pro-14-1
            ];
          };
        };
    in
    {
      nixosConfigurations = nixosConfigurations // {
        
      };
    };
}
