{
  description = "A very basic flake";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    {
      devShell.aarch64-darwin = with import "${nixpkgs}" {
                                        system = "aarch64-darwin";
                                        config.allowUnfree = true;
                                      }; import ./shell.nix { inherit pkgs; };
       devShell.x86_64-darwin = with import "${nixpkgs}" {
                                        system = "x86_64-darwin";
                                        config.allowUnfree = true;
                                      }; import ./shell.nix { inherit pkgs; };
    };
}
