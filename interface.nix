/**
  Collection of interfaces
*/
{ lib, config, ... }:
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
            description = mkOption {
              type = str;
            };
            input = mkOption {
              type = deferredModule;
            };
            output = mkOption {
              type = deferredModule;
            };
            consumer = mkOption {
              type = optionType;
              readOnly = true;
              default = submodule (consumer: {
                options = {
                  provider = mkOption {
                    type = interface.config.provider;
                  };
                  input = mkOption {
                    type = submodule interface.config.input;
                  };
                  output = mkOption {
                    type = submodule interface.config.output;
                    readOnly = true;
                    default = (consumer.config.provider consumer.config.input).output;
                  };
                };
              });
            };
            provider = mkOption {
              type = optionType;
              readOnly = true;
              default = functionTo (
                submodule (provider: {
                  options = {
                    input = mkOption {
                      type = submodule interface.config.input;
                    };
                    output = mkOption {
                      type = submodule interface.config.output;
                    };
                  };
                })
              );
            };
          };
        })
      );
  };
}
