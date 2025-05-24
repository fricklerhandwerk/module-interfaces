/**
  An example consumer of the string-generator interface
*/
{
  config,
  options,
  interfaces,
  lib,
  ...
}:
let
  inherit (lib) mkOption types;
in
{
  options = {
    generated-string = mkOption {
      type = types.str;
    };
  };
}
