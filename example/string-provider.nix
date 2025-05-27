/**
  A sample provider for the interface for generated strings
*/
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption types;
in
{
  options.string-provider = mkOption {
    type = config.interfaces.repeat-character.provider;
  };

  config.string-provider = input: provider: {
    output.string =
      with lib;
      concatStringsSep "" (genList (_: input.character) input.length);
  };
}
