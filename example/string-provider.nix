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
    type = with types; submodule {
      options = {
        provider = mkOption {
          type = config.interfaces.repeat-character.provider;
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
    };
  };

  config.string-provider.provider = input: provider: {
    output.string =
      with lib;
      concatStringsSep config.string-provider.settings.inBetween (genList (_: input.character) input.length);
  };
}
