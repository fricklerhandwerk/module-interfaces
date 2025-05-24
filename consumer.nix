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
          type = submodule config.interfaces.string-of-length.input;
        };
        output = mkOption {
          type = submodule config.interfaces.string-of-length.output;
        };
      };
    };
  };

  config = {
    generated-string.input.length = 3;
  };
}
