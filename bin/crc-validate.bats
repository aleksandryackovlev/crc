#!/usr/bin/env bash

source ./crc-validate

# required test cases
@test "[crc-validate] crc-validate required: return an error string if an empty argument was given" {
  run crc-validate required ''

  [ "$output" = "The field is required" ]
}

@test "[crc-validate] crc-validate required: return an empty string if a valid value was given" {
  run crc-validate required 'test'

  [ "$output" = "" ]
}

@test "[crc-validate] crc-validate required -r: return an empty string if an empty value was given" {
  run crc-validate required -r ''

  [ "$output" = "" ]
}

@test "[crc-validate] crc-validate required -r: return an error string if not an empty argument was given" {
  run crc-validate required -r 'test'

  [ "$output" = "The field should be empty" ]
}

# number test cases
@test "[crc-validate] crc-validate number: return an error string if not a number argument was given" {
  run crc-validate number 'fkd'

  [ "$output" = "Not a number was given" ]
}

@test "[crc-validate] crc-validate number: return an empty string if a valid value was given" {
  run crc-validate number 32

  [ "$output" = "" ]
}

@test "[crc-validate] crc-validate number -r: return an empty string if not a number was given" {
  run crc-validate number -r 'string'

  [ "$output" = "" ]
}

@test "[crc-validate] crc-validate number -r: return an error string if not a number was given" {
  run crc-validate number -r 34

  [ "$output" = "A number was given" ]
}


# file test cases
@test "[crc-validate] crc-validate file: return an error string if not a file argument was given" {
  run crc-validate file fkd

  [ "$output" = "File does not exist" ]
}

@test "[crc-validate] crc-validate file: return an empty string if a valid value was given" {
  run crc-validate file ./crc-validate

  [ "$output" = "" ]
}

@test "[crc-validate] crc-validate file -r: return an empty string if not a file was given" {
  run crc-validate file -r ddjkl

  [ "$output" = "" ]
}

@test "[crc-validate] crc-validate file -r: return an error string if file already exists" {
  run crc-validate file -r ./crc-validate

  [ "$output" = "File already exists" ]
}

# directory test cases
@test "[crc-validate] crc-validate directory: return an error string if not a directory argument was given" {
  run crc-validate directory fkd

  [ "$output" = "Directory does not exist" ]
}

@test "[crc-validate] crc-validate directory: return an empty string if a valid value was given" {
  run crc-validate directory ../bin

  [ "$output" = "" ]
}

@test "[crc-validate] crc-validate directory -r: return an empty string if not a directory was given" {
  run crc-validate directory -r ddjkl

  [ "$output" = "" ]
}

@test "[crc-validate] crc-validate directory -r: return an error string if directory already exists" {
  run crc-validate directory -r ../bin

  [ "$output" = "Directory already exists" ]
}

# yesOrNo test cases
@test "[crc-validate] crc-validate yesOrNo: return an error string if yes or no argument was given" {
  run crc-validate yesOrNo 'jk'

  [ "$output" = "Not yes or no value was given" ]
}

@test "[crc-validate] crc-validate yesOrNo: return an empty string if a valid value was given" {
  run crc-validate yesOrNo 'y'

  [ "$output" = "" ]
}

@test "[crc-validate] crc-validate *: return an error string if an unknown command was given" {
  run crc-validate something 'jk'

  [ "$output" = "An unknown command crc-validate something" ]
}
