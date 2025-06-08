{
  description = "NixOS configuration with Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
        url = "github:kaylorben/nixcord";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, ... }@inputs: {
    nixosConfigurations = {
      hostName = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.n = import ./home.nix;
            home-manager.sharedModules = [
              inputs.nixcord.homeModules.nixcord
            ];
            home-manager.extraSpecialArgs = { inherit inputs; };
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
      };
    };
  };
}
