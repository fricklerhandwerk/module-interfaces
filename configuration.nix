{ config, ... }:
{
  generated-string.provider = config.string-providers;
  string-providers.consumer.input = config.generated-string.input;
  string-providers.consumer.output = config.generated-string.output;
}
