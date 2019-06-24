#!/usr/bin/env bash
source ./crc-create

setup() {
  if [[ ! -f $globalConfigFile ]]; then
    cp ../"$configFileName" "$globalConfigFile"
  fi
}

teardown() {
  if [[ -f ./"$configFileName" ]]; then
    rm ./"$configFileName"
  fi
}

@test "[crc-create] crc-create: should create a directory with a component from a default template" {
  run crc-create SomeComponent

  [ -d ./SomeComponent ]
}
