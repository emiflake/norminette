{
  description = "norminette client";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
  inputs.norminette-client.url = "github:codam-coding-college/norminette-client/master";

  outputs = { self, nixpkgs, norminette-client-src }:
    let
      supportedSystems =
        [ "x86_64-linux" "i686-linux" "aarch64-linux" "x86_64-darwin" ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs supportedSystems (system: f system);
    in {

      packages = forAllSystems (system:
        let
          drv = nixpkgs.callPackage (import ./gem.nix norminette-client-src) { };
        in { norminette = drv; });

      defaultPackage =
        forAllSystems (system: self.packages."${system}".norminette);

      defaultApp = forAllSystems (system: {
        type = "app";
        program = "${self.defaultPackage."${system}"}/bin/norminette";
      });
    };
}
