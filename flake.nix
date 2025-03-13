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
        ./configuration.nix
        ./locale.nix
        ./nvidia.nix
        ./kdeplasma.nix
        #./gnome.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.sose = ./home.nix;
        }
      ];
    };
  };
}
