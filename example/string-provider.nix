# SPDX-License-Identifier: EUPL-1.2
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
    default = input: provider: {
      inherit input; # sorry, boilerplate (for type safety)
      output.string =
        with lib;
        concatStringsSep "" (genList (_: provider.config.input.character) provider.config.input.length);
    };
  };
}
