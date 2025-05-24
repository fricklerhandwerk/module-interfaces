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
      type = with types; attrsOf interfaces.string-of-length;
    };
  };
  config = {
    string-producer.example.output.string =
      with lib;
      concatStringsSep "" (genList (_: "a") config.string-producer.example.input.length);
  };
}
