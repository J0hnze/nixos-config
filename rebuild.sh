#!/usr/bin/env bash

sudo nixos-rebuild switch --impure --flake . --max-jobs 1
