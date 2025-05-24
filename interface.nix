/**
  A sample interface that generates strings of a given length
*/
{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  config._module.args.interfaces.string-of-length =
    with types;
    submodule (interface: {
      options = {
        input = mkOption {
          type =
            with types;
            submodule (input: {
              options.length = mkOption {
                type = types.ints.positive;
              };
            });
        };
        output = mkOption {
          type =
            with types;
            submodule (output: {
              options.string = mkOption {
                type = types.str;
              };
            });
        };
      };
    });
}
