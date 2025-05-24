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
  options = {
    generated-string = mkOption {
      type = config.interfaces.string-of-length.consumer;
    };

  };
  config = {
    generated-string.input.length = 3;
    generated-string.provider = config.string-provider;
  };
}
