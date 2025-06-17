# SPDX-License-Identifier: EUPL-1.2
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
    # and choose a provider
    string-consumer.provider = config.string-provider;
  };
}
