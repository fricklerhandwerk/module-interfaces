{ config, ... }:
{
  generated-string.provider = config.string-providers;
  string-providers.input = config.generated-string.input;
}
