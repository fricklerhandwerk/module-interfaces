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
  options.generated-string = let
    provider = with types; mkOption {
      type = submodule {
        options = {
          inherit consumer;

          input = mkOption {
            type = submodule config.interfaces.string-of-length.input;
          };
          output = mkOption {
            type = submodule config.interfaces.string-of-length.output;
          };
        };
      };
    };

    consumer = with types; mkOption {
      type = submodule {
        options = {
          input = mkOption {
            type = submodule config.interfaces.string-of-length.input;
          };
          output = mkOption {
            type = submodule config.interfaces.string-of-length.output;
          };
        };
      };
    };
  in mkOption {
    type = with types; submodule (consumer: {
      options = {
        inherit provider;

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
  };
}
