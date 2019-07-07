#!/usr/bin/env bash
source ./crc-create

setup() {
  if [[ ! -f $globalConfigFile ]]; then
    cp ../"$configFileName" "$globalConfigFile"
  fi
}

teardown() {
  if [[ -f ./"$configFileName" ]]; then
    rm ./"$configFileName"
  fi

  if [[ -d SomeComponent ]]; then
    rm -rf SomeComponent
  fi
}

@test "[crc-create] addStylesOutput: should return a sed command for adding a styles import" {
  run addStylesOutput 1 styl

  [ "$output" = "s/%CSS_IMPORT%/import '.\/index.styl';/g" ]
}

@test "[crc-create] addStylesOutput: should return a sed command for removing a styles import" {
  run addStylesOutput 0 styl

  [ "$output" = "/%CSS_IMPORT%/d" ]
}

@test "[crc-create] getStylesFileExtention: should return the extention of a styles file from the template directory" {
  touch styles.less
  run getStylesFileExtention "$PWD"
  rm -r 'styles.less'

  [ "$output" = less ]
}

@test "[crc-create] createStylesFile: should do nothing if addStyles argument is 0" {
  run createStylesFile 0 css.css SomeComponent index.css

  [ ! -f index.css ]
  [ "$status" -eq 0 ]
}

@test "[crc-create] createStylesFile: should throw an error if the template file doesn't exitst" {
  run createStylesFile 1 css.css SomeComponent index.css

  [ ! -f index.css ]
  [ "$status" -eq 126 ]
}

@test "[crc-create] createStylesFile: should create a new style file for a given component name" {
  echo "%COMPONENT_NAME%" > css1.css

  run createStylesFile 1 css1.css SomeComponent index1.css

  resultFileContent=$(cat index1.css)

  [ -f index1.css ]
  [ "$resultFileContent" = someComponent ]
  [ "$status" -eq 0 ]

  rm -f 'css1.css'
  rm -f 'index1.css'
}

@test "[crc-create] replaceComponentName: should return the sed command for the component's name replacement" {
  run replaceComponentName SomeComponent

  [ "$output" = 's/%COMPONENT_NAME%/SomeComponent/g' ]
}

@test "[crc-create] createComponentFile: should create a new component file for a given component name" {
  echo "%COMPONENT_NAME%" > component1.ts

  run createComponentFile 's/%COMPONENT_NAME%/something/g' component1.ts someComponent.js

  resultFileContent=$(cat someComponent.js)

  [ -f someComponent.js ]
  [ "$resultFileContent" = something ]
  [ "$status" -eq 0 ]

  rm -f 'component1.ts'
  rm -f 'someComponent.js'
}

@test "[crc-create] createComponentFile: should throw an error if the template file doesn't exitst" {
  run createComponentFile 's/%COMPONENT_NAME%/something/g' component2.ts someComponent2.js

  [ ! -f someComponent2.js ]
  [ "$status" -eq 126 ]
}

@test "[crc-create] createComponentDirectory: should create a directory for a new component file for a given component name" {
  run createComponentDirectory Some1Component

  [ -d Some1Component ]

  rm -rf Some1Component
}

@test "[crc-create] createComponentDirectory: should throw an error if the component name is not given" {
  run createComponentDirectory

  [ "$status" -eq 126 ]
}

@test "[crc-create] getComponentFileExtention: should return the extention of a component file from the template directory" {
  touch component.jsx
  run getComponentFileExtention "$PWD"
  rm -r 'component.jsx'

  [ "$output" = jsx ]
}
