## Norminette

Nix derivations for codam-coding-college/norminette-client

- Bundles default.nix producing `bin/norminette`
- Bundles flake.nix with defaultApp norminette.

## Quickstart
```sh
nix run github:emiflake/norminette/develop -- ./src
```

## Adding this to your home manager, so that you always have norminette available.

### Step 1:
Pin the impure derivation as a variable somewhere
```nix
  norminette = import (pkgs.fetchFromGitHub {
    owner = "emiflake";
    repo = "norminette";
    rev = "7ffaa1d59d0b1d1cdadd77d9b2044456895f0634"; # Change this to newer commits to update
    sha256 = "sha256-CALtcd7rdxOU/YkbK8tu2c3r3LGvuYEJcsQV/jhZZQg=";
  });
```
### Step 2:
Put this in your `home.packages` listing.

## Adding this to a project locally.

### Step 1:
Pin the impure derivation as a variable somewhere as above.
### Step 2:
Put `norminette` in the `buildInputs` listing of the shell.

## Keeping this repo up to date
The important pinned stuff is in `./flake.nix`. The files `Gemfile`, `Gemfile.lock`, and `gemset.nix` are producable from the source repo (although not generated automatically! Perhaps this is a future idea)
