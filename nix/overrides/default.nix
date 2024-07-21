{ lib, config }:

import { jazzy = ./jazzy.nix; }.${config.distro} or (final: prev: { })
