#!/usr/bin/env bash


cd generator && nimble build --verbose && cd $OLDPWD && ./generator/ros2nix
