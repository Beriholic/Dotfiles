{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    ags.url = "github:Aylur/ags/v1";
    matugen = {
      url = "github:/InioX/Matugen";
    };
    more-waita = {
      url = "github:somepaulo/MoreWaita";
      flake = false;
    };
    daeuniverse.url = "github:daeuniverse/flake.nix";
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      hyprland,
      ...
    }:
    {
      nixosConfigurations = {
        jiny = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = { inherit hyprland inputs; };
          modules = [
            ./configuration.nix
            hyprland.nixosModules.default
            home-manager.nixosModules.home-manager
            inputs.daeuniverse.nixosModules.dae
            inputs.daeuniverse.nixosModules.daed
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "back";
                users.beri = import ./home;
                extraSpecialArgs = specialArgs;
              };
            }
          ];
        };
      };
    };
}
