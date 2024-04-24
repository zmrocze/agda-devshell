{
  description = "Agda shell";

  # these caches should at least have the shell for x86_64-linux
  nixConfig = {
    extra-substituters = [
      "https://agda-devshell.cachix.org"
      "https://nix-community.cachix.org"
      "https://cache.iog.io"
      "https://cache.nixos.org"
      "https://iohk.cachix.org"
    ];
    extra-trusted-public-keys = [
      "agda-devshell.cachix.org-1:qPjcQUeeMNRXosSXoT9zWSwHG2TyGG75Uojfso6FHd8="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cache.iog.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo="
    ];  
  };

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    agda-language-server.url = "github:zmrocze/agda-language-server.nix"; 
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, agda-language-server, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    in

    flake-parts.lib.mkFlake { inherit inputs; } {
      inherit systems;
      perSystem = { system, config, pkgs, ... }:
        {
          devShells = {
            agda-shell = pkgs.mkShell {
              packages = with pkgs; [ 
                (agda.withPackages (p: [ p.standard-library ]))
                agda-language-server.packages.${system}.default
              ];
              shellHook = ''
                echo "In path you have 'agda', 'als' and 'agda-mode'."
              '';
            };
          };
        };
      flake = {
        templates.agda = {
          description = "Agda project template";
          path = ./templates/agda;
          welcomeText = ''
              This is an Agda project template with 2 agda source files.
              
              I don't know how important the agda-template.agda-lib file is \_(ツ)_/¯.

              If you use direnv check out .envrc.example.
            '';
          };
        };
      };
}
