let
  sources = import ./npins;
in
{
  nixpkgs ? sources.nixpkgs,
}:
let
  example = lib.evalModules {
    modules = [
      ./interface.nix
      ./example
    ];
  };
  lib = import "${nixpkgs}/lib";
in
{
  nixpkgs =
    {
      system ? builtins.currentSystem,
      config ? { },
      overlays ? [ ],
      ...
    }@nixpkgs-config:
    let
      pkgs = import nixpkgs nixpkgs-config;
      test-loop = pkgs.writeShellApplication {
        name = "test-loop";
        text =
          with pkgs;
          with lib;
          ''
            ${getExe watchexec} -w ${toString ./.} -- nix-instantiate --eval --strict ./. -A example.config.string-consumer.output --json "$@"
          '';
      };
    in
    {
      shell = pkgs.mkShellNoCC {
        packages = lib.attrValues {
          inherit (pkgs) npins;
          inherit test-loop;
        };
        shellHook = ''
          echo "run tests in a loop with '${test-loop.name}'"
        '';
      };
    };
  example =
    assert example.config.string-consumer.output.string == "aaa";
    example;
}
