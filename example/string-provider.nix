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
  options.string-providers = mkOption {
    type = with types; attrsOf (submodule (providerSpecific: {
      options = {
        provider = mkOption {
          type = config.interfaces.repeat-character.provider;
          default = input: provider: {
            output.string =
              with lib;
              concatStringsSep providerSpecific.config.settings.inBetween (genList (_: input.character) input.length);
          };
        };
        settings = mkOption {
          type = submodule {
            options = {
              inBetween = mkOption {
                type = enum [ "" " " "-" "/" ];
                default = "";
              };
            };
          };
        };
      };
    }));
  };
}
