{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = github:numtide/flake-utils;
    nixpkgs.url = github:nixos/nixpkgs;
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        devShell = pkgs.mkShell {
          packages = [
            pkgs.simplehttp2server
            pkgs.nodejs
            pkgs.nodePackages.live-server
            ];
          # shellHook = "fish";
        };
      });
}
