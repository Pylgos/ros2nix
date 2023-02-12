#!/usr/bin/env bash

cd ros2nix && nimble build --verbose && cd $OLDPWD && ./ros2nix/ros2nix generate
