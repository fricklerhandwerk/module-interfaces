# SPDX-License-Identifier: EUPL-1.2
/**
  A sample interface that generates strings of a given length
*/
{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  config.interfaces.repeat-character = {
    description = "repeat a character a given number of times";
    input = input: {
      options.length = mkOption {
        type = types.ints.positive;
      };
      options.character = mkOption {
        type = types.enum [
          "a"
          "b"
        ];
      };
    };
    output = output: {
      options.string = mkOption {
        type = types.str;
      };
    };
  };
}
