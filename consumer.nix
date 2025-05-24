/**
  An example consumer of the string-generator interface
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
  options.generated-string = mkOption {
    type = with types; submodule {
      options = {
        input = mkOption {
          type = submodule {
            options.length = mkOption {
              type = types.ints.positive;
            };
          };
        };
        output = mkOption {
          type = submodule {
            options.string = mkOption {
              type = types.str;
              readOnly = true;
            };
          };
        };
      };
    };
  };

  config = {
    generated-string.input.length = 3;
  };
}
