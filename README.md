## Norminette

Nix derivations for codam-coding-college/norminette-client

- Bundles default.nix producing `bin/norminette`
- Bundles flake.nix with defaultApp norminette.

## Quickstart
```sh
nix run github:emiflake/norminette/develop -- ./src
```

## Keeping this repo up to date
The important pinned stuff is in `./flake.nix`. The files `Gemfile`, `Gemfile.lock`, and `gemset.nix` are producable from the source repo (although not generated automatically! Perhaps this is a future idea)
