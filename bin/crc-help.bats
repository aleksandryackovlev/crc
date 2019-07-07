#!/usr/bin/env bash
source ./crc-help

# showUsageInfo test cases
@test "[crc-help] showUsageInfo: should print the usage info" {
  run showUsageInfo

  [ "${lines[0]}" = 'crc - Create a react component' ]
  [ "${lines[1]}" = 'USAGE: "crc <COMMAND> [<ARGUMENTS>] [<COMPONENT_NAME>]"' ]
}

# showVersionInfo test cases
@test "[crc-help] showVersionInfo: should print the version info" {
  run showVersionInfo

  [ "${lines[0]}" = 'crc version 0.1.0' ]
  [ "${lines[1]}" = 'by Alex Y' ]
}


# crc-help test cases
@test "[crc-help] crc-help: should proxy call the showUsageInfo function if not any argument is given" {
  run crc-help

  [ "${lines[0]}" = 'crc - Create a react component' ]
  [ "${lines[1]}" = 'USAGE: "crc <COMMAND> [<ARGUMENTS>] [<COMPONENT_NAME>]"' ]
}

@test "[crc-help] crc-help version: should proxy its arguments to the showVersion function" {
  run crc-help version

  [ "${lines[0]}" = 'crc version 0.1.0' ]
  [ "${lines[1]}" = 'by Alex Y' ]
}

@test "[crc-help] crc-help *: should exit with an error message if an unknow command was given" {
  run crc-help something 3 'Something wrong has happend'

  [ "$status" -eq 2 ]

  value="${csi}31mAn unknown command crc-help something"$'\n'"${csi}m"
  [ "$output" = "$value" ]
}
