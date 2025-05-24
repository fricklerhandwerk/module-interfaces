/**
  A sample interface that generates strings of a given length
*/
{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  config.interfaces.string-of-length = {
    input = input: {
      options.length = mkOption {
        type = types.ints.positive;
      };
    };
    output = output: {
      options.string = mkOption {
        type = types.str;
      };
    };
  };
}
