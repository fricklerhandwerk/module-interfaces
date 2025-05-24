{ config, ... }:
{
  string-providers.input = config.generated-string.input;
  generated-string.output = config.string-providers.output;
}
