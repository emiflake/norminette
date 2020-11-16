src:
{ stdenv, bundlerEnv, ruby }:
let
  gems = bundlerEnv {
    name = "norminette-env";
    inherit ruby;
    gemdir = ./.;
  };
in stdenv.mkDerivation {
  name = "norminette";
  src = src;
  buildInputs = [ gems ruby ];
  installPhase = ''
        mkdir -p $out/{bin,share/norminette-client}
        cp -r * $out/share/norminette-client
        bin=$out/bin/norminette
        cat > $bin <<EOF
    #!/bin/sh -e
    exec ${gems}/bin/bundle exec ${ruby}/bin/ruby $out/share/norminette-client/norminette.rb "\$@"
    EOF
        chmod +x $bin
      '';
}
