#!/usr/bin/env bash
source ./crc-input

esc=$'\e'
csi="$esc["

interact() {
  echo "${csi}B"
  sleep 1
  echo q
}

# textInput test cases
@test "[crc-input] textInput: should read the user input and return" {
  run textInput -p "what is the text?" <<< "some input"

  [ "$output" = "some input" ]
}

@test "[crc-input] textInput: should set a variable to a default value if the input was empty" {
  run textInput -p "what is the text? " -d 'test' <<< ''

  [ "$output" = "test" ]
}

@test "[crc-input] selectInput: should set a global variable input to the given value" {
  selectInput -C "test1:test1" "test3:test3" "test2:test2" <<< $(interact) >/dev/null

  [ "$input" = "test3" ]
}

@test "[crc-input] crc-input text: should proxy its arguments to the textInput function" {
  run textInput -p "what is the text?" <<< "some input"

  [ "$output" = "some input" ]
}

@test "[crc-input] crc-input select: should proxy its arguments to the selectInput function" {
  selectInput -C "test1:test1" "test3:test3" "test2:test2" <<< $(interact) >/dev/null

  [ "$input" = "test3" ]
}

@test "[crc-input] crc-input *: should exit with an error message if an unknow command was given" {
  run crc-input something 3 'Something wrong has happend'

  [ "$status" -eq 2 ]
  [ "$output" = 'An unknown command crc-input something' ]
}
