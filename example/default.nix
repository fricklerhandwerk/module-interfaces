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
    # configure a specific provider
    string-providers."space separated".settings.inBetween = " ";
    # and choose a provider
    string-consumer.provider = config.string-providers."space separated".provider;
  };
}
