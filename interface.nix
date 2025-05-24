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
            input = mkOption {
              type = types.deferredModule;
            };
            output = mkOption {
              type = types.deferredModule;
            };
            consumer = mkOption {
              type = types.optionType;
              readOnly = true;
              default =
                with types;
                submodule (consumer: {
                  options = {
                    provider = mkOption {
                      type = interface.config.provider;
                    };
                    input = mkOption {
                      type = types.submodule interface.config.input;
                    };
                    output = mkOption {
                      type = types.submodule interface.config.output;
                      readOnly = true;
                      default = consumer.config.provider.output;
                    };
                  };
                });
            };
            provider = mkOption {
              type = optionType;
              readOnly = true;
              default =
                with types;
                submodule (provider: {
                  options = {
                    # TODO: we don't actually want to set the consumer explicitly, otherwise "registering" both consumers and providers is unavoidable.
                    # rather, we want to pass a provider to a consumer, and then wire up passing input and output values here in the abstract interface (ideally)
                    #consumer = mkOption {
                    #type = interface.config.consumer;
                    #};
                    #input = mkOption {
                    #type = types.submodule interface.config.input;
                    #readOnly = true;
                    #default = provider.config.consumer.input;
                    #};
                    output = mkOption {
                      type = types.submodule interface.config.output;
                    };
                  };
                });
            };
          };
        })
      );
  };
}
