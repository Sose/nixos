{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations.enne = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        ./modules/locale.nix
        ./modules/audio.nix
        ./modules/nvidia.nix
        ./modules/kdeplasma.nix
        ./modules/hyprland.nix
        #./gnome.nix
        ./modules/gaming.nix
        ./modules/virtualization.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.sose = ./hosts/default/home.nix;
        }
      ];
    };
  };
}
