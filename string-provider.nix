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
    type = with types; submodule {
      options = {
        input = mkOption {
          type = submodule {
            options.length = mkOption {
              type = types.ints.positive;
              readOnly = true;
            };
          };
        };
        output = mkOption {
          type = submodule {
            options.string = mkOption {
              type = types.str;
            };
          };
        };
      };
    };
  };

  config.string-providers = {
    output.string =
      with lib;
      # TODO: somehow we need to know our provider's input value without explictly registering a consumer of this provider!
      concatStringsSep "" (genList (_: "a") config.string-providers.input.length);
  };
}
