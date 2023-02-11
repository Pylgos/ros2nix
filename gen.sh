#!/usr/bin/env bash

cd generator && nimble build --verbose && cd $OLDPWD && ./ros2nix/ros2nix
