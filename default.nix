let
  sources = import ./npins;
in
{
  nixpkgs ? sources.nixpkgs,
}:
let
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
            ${getExe watchexec} -w ${toString ./.} -- nix-instantiate --eval --strict ./. -A example.config.generated-string --json "$@"
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
    let
      eval = lib.evalModules {
        modules = [
          ./interface.nix
          ./string-interface.nix
          ./string-provider.nix
          ./consumer.nix
        ];
      };
    in
    assert eval.config.generated-string.output.string == "aaa";
    eval;
  test = lib.evalModules {
    modules = [
      ./interface.nix
      ./string-interface.nix
      ./string-provider.nix
      ./consumer.nix
    ];
  };
}
