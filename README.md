# Interfaces in the module system

This is an experiment to capture the spirit and commonalities of:
- [SelfHostBlocks](https://github.com/ibizaman/selfhostblocks/) by @ibizaman
- [vars](https://github.com/NixOS/nixpkgs/pull/370444) by @lassulus et al.
- [modular services](https://github.com/NixOS/nixpkgs/pull/372170) by @roberth

The general idea is what amounts to a "modular" function type that allows to separate interfaces from implementation when computing module system option values.

The question is how to wire this up!
