#!/usr/bin/env bash
source ./crc-input

# textInput test cases
@test "[crc-input] textInput: should read the user input and return" {
  run textInput -p "what is the text?" <<< "some input"

  [ "$output" = "some input" ]
}

@test "[crc-input] textInput: should set a variable to a default value if the input was empty" {
  run textInput -p "what is the text? " -d 'test' <<< ''

  [ "$output" = "test" ]
}
