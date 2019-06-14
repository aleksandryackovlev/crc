#!/usr/bin/env bash
source ./crc-config

setup() {
  if [[ ! -f $globalConfigFile ]]; then
    cp ../"$configFileName" "$globalConfigFile"
  fi

  printf "createFileComponent=1\n" > ./"$configFileName"
  printf "componentType=classical\n" >> ./"$configFileName"
}

teardown() {
  if [[ -f ./"$configFileName" ]]; then
    rm ./"$configFileName"
  fi
}

# readGlobalConfig test cases
@test "[crc-config] readGlobalConfig: should read the variables from the global config file" {
  readGlobalConfig

  [ "$createFileComponent" -eq 0 ]
  [ "$componentType" = functional ]
  [ "$fileExtention" = js ]
  [ "$addCss" -eq 0 ]
  [ "$template" = 'default' ]
}

# readLocalConfig test cases
@test "[crc-config] readLocalConfig: should read the variables from the local config file" {
  readLocalConfig

  [ "$createFileComponent" -eq 1 ]
  [ "$componentType" = classical ]
}

# readConfig test cases
@test "[crc-config] readConfig: should read the variables from the global and the local config files" {
  readConfig

  [ "$createFileComponent" -eq 1 ]
  [ "$componentType" = classical ]
  [ "$fileExtention" = js ]
  [ "$addCss" -eq 0 ]
  [ "$template" = 'default' ]
}

@test "[crc-config] crc-config read: should proxy its arguments to the readConfig function" {
  crc-config read

  [ "$createFileComponent" -eq 1 ]
  [ "$componentType" = classical ]
  [ "$fileExtention" = js ]
  [ "$addCss" -eq 0 ]
  [ "$template" = 'default' ]
}

@test "[crc-config] crc-config *: should exit with an error message if an unknow command was given" {
  run crc-config something

  [ "$status" -eq 2 ]
  [ "$output" = 'An unknown command crc-config something' ]
}
