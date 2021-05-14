{ pkgs ? import <nixpkgs> { } }: with pkgs;
let
  node = nodejs-14_x;
in
mkShell {
  buildInputs = [
    node
    (yarn.override { nodejs = node; })
    which
    git
  ];

  shellHook = ''
    echo "Welcome to Node.js Nix env"
    export NODE_PATH=$PWD/.nix-node
    export NPM_CONFIG_PREFIX=$PWD/.nix-node
    export PATH=$NODE_PATH/bin:$PATH
    mkdir -p "$NODE_PATH"
  '';
}
