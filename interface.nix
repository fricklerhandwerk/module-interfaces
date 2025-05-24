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
            provider = mkOption {
              type = optionType;
              readOnly = true;
              default = mkOption {
                type =
                  with types;
                  # TODO: we may want to have multiple providers per interface, but not convince
                  submodule (provider: {
                    input = mkOption {
                      # dependent types!
                      type = interface.config.input;
                      readOnly = true;
                      default = null;
                    };
                    output = mkOption {
                      # dependent types!
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
