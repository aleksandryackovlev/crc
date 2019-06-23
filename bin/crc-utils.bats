#!/usr/bin/env bash
source ./crc-utils


# die test cases
@test "[crc-utils] die: should exit with a given error code" {
  run die 126

  [ "$status" -eq 126 ]
}

@test "[crc-utils] die: should exit with an exit code 1 if not a number was given as argumant" {
  run die something

  [ "$status" -eq 1 ]
}

@test "[crc-utils] die: should print a given text description if it is set" {
  run die 2 "something happend"

  [ "$output" = 'something happend' ]
}

@test "[crc-utils] die: should not print any if it is not set" {
  run die 2

  [ -z "$output" ]
}


# crc-utils test cases
@test "[crc-utils] crc-utils die: should proxy its arguments to the die function" {
  run crc-utils die 3 'Something wrong has happend'

  [ "$status" -eq 3 ]
  [ "$output" = 'Something wrong has happend' ]
}

@test "[crc-utils] crc-utils *: should exit with an error message if an unknow command was given" {
  run crc-utils something 3 'Something wrong has happend'

  [ "$status" -eq 2 ]
  [ "$output" = 'An unknown command crc-utils something' ]
}
