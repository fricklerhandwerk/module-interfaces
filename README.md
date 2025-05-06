# Interfaces in the module system

This is an experiment to capture the spirit and commonalities of:
- [SelfHostBlocks](https://github.com/ibizaman/selfhostblocks/) by @ibizaman
- [Clan vars](https://github.com/NixOS/nixpkgs/pull/370444) by @lassulus et al.
- [modular services](https://github.com/NixOS/nixpkgs/pull/372170) by @roberth

The general idea is to connect module system options via interfaces.
These interfaces are modules themselves.

The question is how to wire them up!
