/**
  Collection of interfaces
*/
{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.interfaces = mkOption {
    type =
      with types;
      attrsOf (
        submodule (interface: {
          options = {
            input = mkOption {
              type = types.deferredModule;
            };
            output = mkOption {
              type = types.deferredModule;
            };
            consumer = mkOption {
              type = types.optionType;
              default =
                with types;
                submodule (consumer: {
                  input = mkOption {
                    type = interface.config.input;
                  };
                  output = mkOption {
                    type = interface.config.output;
                    readOnly = true;
                    default = interface.config.provider.output;
                  };
                });
            };
            provider = mkOption {
              type = optionType;
              readOnly = true;
              default = mkOption {
                type =
                  with types;
                  submodule (provider: {
                    input = mkOption {
                      type = interface.config.input;
                      readOnly = true;
                      default = interface.config.consumer.input;
                    };
                    output = mkOption {
                      type = interface.config.output;
                    };
                  });
              };
            };
          };
        })
      );
  };
}
