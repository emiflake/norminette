let
  nixpkgs = import <nixpkgs> { };

  norminette-client-src = nixpkgs.fetchFromGitHub {
    owner = "codam-coding-college";
    repo = "norminette-client";
    rev = "2db4a9621a1e10808c8d56be07d6ee08a05ac67f";
    hash = "sha256-VbKtD1AP1mvJJeY7dDiICQHD7g8S2OTZE8zva8sv5tM=";
  };
in nixpkgs.callPackage (import ./gem.nix norminette-client-src) { }
