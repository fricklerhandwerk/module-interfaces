{ config, ... }:
{
  generated-string.provider = config.string-providers;
  string-providers.consumer = config.generated-string;
}
