#!/usr/bin/env bash
source ./crc-env

# crc-env test cases
@test "[crc-env] crc-env: should return the value of a given env variable" {

  [ "$(crc-env configFileName)" = '.crcrc' ]
  [ "$(crc-env defaultComponentType)" = functional ]
}
