#!/usr/bin/env bash
source ./crc-template


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

@test "[crc-template] createTemplate: should throw an error if the template already exitsts" {
  run createTemplate default

  [ "$status" -eq 1 ]
}

@test "[crc-template] createTemplate: should a new template" {
  templateDirectory="$(dirname "$PWD")/template"

  run createTemplate -n -j jsx -s random testTemplate

  [ -d "$templateDirectory/testTemplate" ]
  [ ! -f "$templateDirectory/testTemplate/styles.random" ]
  [ -f "$templateDirectory/testTemplate/styles.css" ]
  [ -f "$templateDirectory/testTemplate/component.jsx" ]

  rm -rf "$templateDirectory/testTemplate"
}
