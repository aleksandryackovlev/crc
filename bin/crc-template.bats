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

@test "[crc-template] copyTemplate: should throw an error if the template already exitsts" {
  run copyTemplate classical default

  [ "$status" -eq 1 ]
}

@test "[crc-template] copyTemplate: should throw an error if the source template doesn't exitst" {
  run copyTemplate unknown someTemplate

  [ "$status" -eq 1 ]
}

@test "[crc-template] copyTemplate: should copy a template" {
  templateDirectory="$(dirname "$PWD")/template"

  run copyTemplate -n default copiedTemplate

  [ -d "$templateDirectory/copiedTemplate" ]
  [ -f "$templateDirectory/copiedTemplate/styles.css" ]
  [ -f "$templateDirectory/copiedTemplate/component.js" ]

  componentDiff=$(diff "$templateDirectory/default/component.js" "$templateDirectory/copiedTemplate/component.js")
  stylesDiff=$(diff "$templateDirectory/default/styles.css" "$templateDirectory/copiedTemplate/styles.css")

  [ -z "$componentDiff" ]
  [ -z "$stylesDiff" ]

  rm -rf "$templateDirectory/copiedTemplate"
}

@test "[crc-template] editTemplate: should throw an error if the template doesn't exitst" {
  run editTemplate unknown

  [ "$status" -eq 1 ]
}

@test "[crc-template] deleteTemplate: should not allow to delete system templates" {
  run deleteTemplate default

  [ "$status" -eq 1 ]
}

@test "[crc-template] deleteTemplate: should delete a template" {
  templateDirectory="$(dirname "$PWD")/template"

  copyTemplate -n default toDeleteTemplate

  [ -d "$templateDirectory/toDeleteTemplate" ]

  run deleteTemplate toDeleteTemplate

  [ ! -d "$templateDirectory/toDeleteTemplate" ]
}

@test "[crc-template] listTemplates: should show a list of all available templates" {
  templateDirectory="$(dirname "$PWD")/template"

  run listTemplates

  [ "${lines[0]}" = classical ]
  [ "${lines[1]}" = default ]
}
