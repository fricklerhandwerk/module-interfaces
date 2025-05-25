/**
  A sample provider for the string-generator interface
*/
{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkOption types;
in
{
  options.string-providers = mkOption {
    type = with types; submodule (provider: {
      options = {
        consumer = with types; mkOption {
          type = submodule {
            options = {
              input = mkOption {
                type = submodule config.interfaces.string-of-length.input;
              };
              output = mkOption {
                type = submodule config.interfaces.string-of-length.output;
              };
            };
          };
        };
        input = mkOption {
          type = submodule config.interfaces.string-of-length.input;
          default = provider.config.consumer.input;
        };
        output = mkOption {
          type = submodule config.interfaces.string-of-length.output;
        };
      };
    });
  };

  config.string-providers = {
    output.string =
      with lib;
      # TODO: somehow we need to know our provider's input value without explictly registering a consumer of this provider!
      concatStringsSep "" (genList (_: "a") config.string-providers.input.length);
  };
}
