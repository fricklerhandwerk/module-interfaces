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
  options.string-providers = mkOption {
    type = with types; attrsOf config.interfaces.string-of-length.provider;
  };

  config.string-providers.example = {
    output.string =
      with lib;
      # TODO: somehow we need to know our provider's input value without explictly registering a consumer of this provider!
      concatStringsSep "" (genList (_: "a") config.generated-string.input.length);
  };
}
