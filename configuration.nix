{ config, ... }:
{
  generated-string.provider.input = config.string-providers.input;
  generated-string.provider.output = config.string-providers.output;
  string-providers.consumer.input = config.generated-string.input;
  string-providers.consumer.output = config.generated-string.output;
}
