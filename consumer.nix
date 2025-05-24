/**
  An example consumer of the string-generator interface
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
  options.generated-string = mkOption {
    type = with types; submodule (consumer: {
      options = {
        provider = mkOption {
          type = submodule {
            options = {
              input = mkOption {
                type = submodule config.interfaces.string-of-length.input;
                # TODO: Why is this default not being evaluated?
                # default = consumer.config.input;
              };
              output = mkOption {
                type = submodule config.interfaces.string-of-length.output;
              };
            };
          };
        };
        input = mkOption {
          type = submodule config.interfaces.string-of-length.input;
        };
        output = mkOption {
          type = submodule config.interfaces.string-of-length.output;
          default = consumer.config.provider.output;
        };
      };
    });
  };

  config = {
    generated-string.input.length = 3;
    # TODO: this is not working either
    # generated-string.provider.input = config.generated-string.input;
  };
}
