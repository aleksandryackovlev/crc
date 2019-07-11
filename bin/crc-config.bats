#!/usr/bin/env bash
source ./crc-config

setup() {
  if [[ ! -f $globalConfigFile ]]; then
    cp ../"$configFileName" "$globalConfigFile"
  fi

  printf "createFileComponent=1\n" > ./"$configFileName"
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
  [ "$addCss" -eq 0 ]
  [ "$template" = 'default' ]
}

# readLocalConfig test cases
@test "[crc-config] readLocalConfig: should read the variables from the local config file" {
  readLocalConfig

  [ "$createFileComponent" -eq 1 ]
}

# findLocalConfig test cases
@test "[crc-config] findLocalConfig: should find the local config file" {
  run findLocalConfig
  configFile="$PWD"/.crcrc

  [ "$output" = "$configFile" ]
}

# getEditor test cases
@test "[crc-config] getEditor: should return an editor if it is set" {
  EDITOR=vim
  run getEditor
  [ "$output" = vim ]
}

@test "[crc-config] getEditor: should return vi as a default editor if it is not set" {
  EDITOR=
  run getEditor
  [ "$output" = vi ]
}

# editConfigFile
@test "[crc-config] editConfigFile: should open a config file in a default editor" {
  EDITOR=echo
  run editConfigFile
  expectedConfigFile="$PWD"/.crcrc

  [ "$output" =  "$expectedConfigFile" ]
}

@test "[crc-config] editConfigFile: should throw an error if a local config file doesn't exist" {
  configFileName=abracadabre
  run editConfigFile
  [ "$status" -eq 1 ]

  value="${csi}31mA local config file doesn't exist"$'\n'"${csi}m"
  [ "$output" = "$value" ]
}

# editConfigFile
@test "[crc-config] createConfigFile: should create a config file and open it in a default editor" {
  EDITOR=cat
  expectedConfigFile="$PWD"/.crcrc

  rm "$expectedConfigFile"

  [ ! -f "$expectedConfigFile" ]

  run createConfigFile

  [ -f "$expectedConfigFile" ]
  [ "${lines[0]}" = 'createFileComponent=0' ]
  [ "${lines[1]}" = 'componentType=functional' ]
  [ "${lines[2]}" = 'fileExtention=js' ]
  [ "${lines[3]}" = 'addCss=0' ]
  [ "${lines[4]}" = 'template=default' ]
}

@test "[crc-config] createConfigFile: should throw an error if a local config file already exists" {
  expectedOutput="${csi}31mA file ${PWD}/.crcrc already exists"$'\n'"${csi}m"

  run createConfigFile

  [ "$status" -eq 1 ]
  [ "$output" =  "$expectedOutput" ]
}

@test "[crc-config] createConfigFile: should create a config file in a given directory and open it in a default editor" {
  EDITOR=cat
  dir="$HOME"/"$RANDOM"

  mkdir "$dir"

  expectedConfigFile="$dir"/.crcrc

  [ ! -f "$expectedConfigFile" ]

  run createConfigFile "$dir"

  [ -f "$expectedConfigFile" ]
  [ "${lines[0]}" = 'createFileComponent=0' ]
  [ "${lines[1]}" = 'componentType=functional' ]
  [ "${lines[2]}" = 'fileExtention=js' ]
  [ "${lines[3]}" = 'addCss=0' ]
  [ "${lines[4]}" = 'template=default' ]

  rm -rf "$dir"
}

@test "[crc-config] createConfigFile: should throw an error if a given directory doesn't exist" {
  expectedOutput="${csi}31mA directory /abracadabra doesn't exist"$'\n'"${csi}m"

  run createConfigFile /abracadabra

  [ "$status" -eq 1 ]
  [ "$output" =  "$expectedOutput" ]
}

@test "[crc-config] deleteConfigFile: should delete a config file if it exists" {
  expectedConfigFile="$PWD"/.crcrc

  [ -f "$expectedConfigFile" ]

  run deleteConfigFile

  [ ! -f "$expectedConfigFile" ]
}

# readConfig test cases
@test "[crc-config] readConfig: should read the variables from the global and the local config files" {
  readConfig

  [ "$createFileComponent" -eq 1 ]
  [ "$addCss" -eq 0 ]
  [ "$template" = 'default' ]
}

# crc-config test cases
@test "[crc-config] create: should proxy its arguments to the createConfigFile function" {
  EDITOR=cat
  expectedConfigFile="$PWD"/.crcrc

  rm "$expectedConfigFile"

  [ ! -f "$expectedConfigFile" ]

  run crc-config create

  [ -f "$expectedConfigFile" ]
  [ "${lines[0]}" = 'createFileComponent=0' ]
  [ "${lines[1]}" = 'componentType=functional' ]
  [ "${lines[2]}" = 'fileExtention=js' ]
  [ "${lines[3]}" = 'addCss=0' ]
  [ "${lines[4]}" = 'template=default' ]
}

@test "[crc-config] crc-config edit: should proxy its arguments to the editConfigFile function" {
  EDITOR=echo
  run crc-config edit
  expectedConfigFile="$PWD"/.crcrc

  [ "$output" =  "$expectedConfigFile" ]
}

@test "[crc-config] crc-config read: should proxy its arguments to the readConfigFile function" {
  crc-config read

  [ "$createFileComponent" -eq 1 ]
  [ "$addCss" -eq 0 ]
  [ "$template" = 'default' ]
}

@test "[crc-config] crc-config delete: should proxy its arguments to the deleteConfigFile function" {
  expectedConfigFile="$PWD"/.crcrc

  [ -f "$expectedConfigFile" ]

  run crc-config delete

  [ ! -f "$expectedConfigFile" ]
}

@test "[crc-config] crc-config *: should exit with an error message if an unknow command was given" {
  run crc-config something

  [ "$status" -eq 2 ]
  value="${csi}31mAn unknown command crc-config something"$'\n'"${csi}m"
  [ "$output" = "$value" ]
}
