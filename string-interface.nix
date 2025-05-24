/**
  A sample interface that generates strings of a given length
*/
{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  config.interfaces.string-of-length = implementation: {
    input = input: {
      options.length = mkOption {
        type = types.ints.positive;
      };
    };
    output = output: {
      options.string = mkOption {
        type = types.str;
        readOnly = true;
        # XXX: ideally we'd want the provider's output to
        # be taken wholesale, but there's no other place
        # we can obtain this value except at the
        # consumer's call site, where we really don't want
        # to bother with this implementation detail
        default = implementation.config.provider.output.string;
      };
    };
  };
}
