{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [ 
  	(agda.withPackages (p: [ p.standard-library ]))
  ];
  # shellHook = ''
  #   alias als="~/.local/bin/als"
  # '';
}
