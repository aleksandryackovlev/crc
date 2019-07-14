#!/usr/bin/env bash
source ./crc-template

setup() {
  templateDirectory=../template
  if [[ ! -f $globalConfigFile ]]; then
    cp ../"$configFileName" "$globalConfigFile"
  fi
}

teardown() {
  if [[ -f ./"$configFileName" ]]; then
    rm ./"$configFileName"
  fi

  if [[ -d "$templateDirectory/testTemplate" ]]; then
    rm -rf "$templateDirectory/testTemplate"
  fi
}

@test "[crc-template] createTemplate: should throw an error if the template already exitsts" {
  run createTemplate default

  [ "$status" -eq 1 ]
}
