/**
  An example consumer of the string-generator interface
*/
{
  config,
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
      default = config.string-producer.output.string;
    };
  };
  config = {
    string-producer.input.length = 3;
  };

}
