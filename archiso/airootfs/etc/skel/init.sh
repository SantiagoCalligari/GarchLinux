#!/bin/sh
exec xdg-user-dirs-update --force
exec chown -R $(whoami):$(whoami) ~/*
rm -rf ./init.sh
