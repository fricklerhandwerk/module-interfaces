/**
  A sample provider for the string-generator interface
*/
{
  lib,
  config,
  interfaces,
  ...
}:
let
  inherit (lib) mkOption types;
in
{
  options = {
    string-producer = mkOption {
      type = interfaces.string-of-length;
    };
  };
}
