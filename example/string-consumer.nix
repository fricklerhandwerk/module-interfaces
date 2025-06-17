# SPDX-License-Identifier: EUPL-1.2
/**
  An example integration site for generated strings
*/
{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkOption types;
in
{
  options = {
    string-consumer = mkOption {
      type = config.interfaces.repeat-character.consumer;
    };
  };
  config = {
    # the module author can also set some input parameters
    string-consumer.input.length = 3;
  };
}
