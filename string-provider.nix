/**
  A sample provider for the string-generator interface
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
    type = config.interfaces.string-of-length.provider;
    default = input: provider: {
      inherit input; # sorry, boilerplate (for type safety)
      output.string = with lib; concatStringsSep "" (genList (_: "a") provider.config.input.length);
    };
  };
}
