{
  description = "norminette client";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";

  outputs = { self, nixpkgs }:
    let
      supportedSystems =
        [ "x86_64-linux" "i686-linux" "aarch64-linux" "x86_64-darwin" ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs supportedSystems (system: f system);
    in {

      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs { localSystem = system; };

          # Hardcoded magic stuff here.
          norminette-client-src = pkgs.fetchFromGitHub {
            owner = "codam-coding-college";
            repo = "norminette-client";
            rev = "2db4a9621a1e10808c8d56be07d6ee08a05ac67f";
            hash = "sha256-VbKtD1AP1mvJJeY7dDiICQHD7g8S2OTZE8zva8sv5tM=";
          };
          drv = pkgs.callPackage (import ./gem.nix norminette-client-src) { };
        in { norminette = drv; });

      defaultPackage =
        forAllSystems (system: self.packages."${system}".norminette);

      defaultApp = forAllSystems (system: {
        type = "app";
        program = "${self.defaultPackage."${system}"}/bin/norminette";
      });
    };
}
