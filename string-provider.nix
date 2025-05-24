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
    string-provider = mkOption {
      type = with types; interfaces.string-of-length.provider;
      default = {
        output.string =
          with lib;
          concatStringsSep "" (genList (_: "a") config.string-provider.input.length);
      };
    };
  };
}
