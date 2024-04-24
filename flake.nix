{
  description = "Agda shell";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    agda-language-server.url = "github:zmrocze/agda-language-server.nix"; 
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, agda-language-server, ... }:
    let
      # We leave it to just linux to be able to run `nix flake check` on linux, 
      # see bug https://github.com/NixOS/nix/issues/4265
      # systems = [ "x86_64-linux" ];
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
    };
}
