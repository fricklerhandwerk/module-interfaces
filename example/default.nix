{ config, ... }:
{
  imports = [
    ./string-interface.nix
    ./string-provider.nix
    ./string-consumer.nix
  ];
  config = {
    # the integrator can set input parameters
    string-consumer.input.character = "a";
    # configure a provider's specific options
    string-provider."space separated".settings.inBetween = " ";
    # and choose a provider
    string-consumer.provider = config.string-provider.provider;
  };
}
