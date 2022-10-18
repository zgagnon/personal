{ pkgs ? import <nixpkgs> {}}:
let

  shell = pkgs.mkShell {
    nativeBuildInputs = [
      pkgs.nodejs-16_x
      pkgs.nodePackages.pnpm
      pkgs._1password
      pkgs.terraform
      pkgs.gh
      pkgs.jq
    ];

    shellHook = ''
      export PATH=$PWD/bin:$PWD/bin/adr:$PATH
      export NODE_OPTIONS=--max_old_space_size=4096
      if [ ! -e .env ]; then
          ln -s packages/app/.env .env
      fi
    '';
  };

in shell

