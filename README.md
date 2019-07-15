 # CRC - Create React Component
[![Build Status](https://travis-ci.org/aleksandryackovlev/crc.svg?branch=master)](https://travis-ci.org/aleksandryackovlev/crc) ![GitHub release](https://img.shields.io/github/release/aleksandryackovlev/crc.svg) ![GitHub](https://img.shields.io/github/license/aleksandryackovlev/crc.svg)  
An easy to use cli-tool that simplifies the process of creation of React components.
  
  
## Installation
```shell
$ git clone https://github.com/aleksandryackovlev/crc.git
$ cd crc
$ make install
```
  
   
## crc create
Create React component
### Synopsis
```shell
crc create [-f] [-s] [-t <TEMPLATE>] [-d <DIRECTORY>] [ -l <LIFECYCLE_METHODS>]
    [-h <HANDLERS>] [-m <METHODS>] <COMPONENT_NAME> [<PROPS>]
```
### Description
If the placeholder for an option is not defined in a template, this option will not appear in the resulting file even if it is set in the command.
### Options
`-f`  
&nbsp;&nbsp;&nbsp;&nbsp; Create a file component.

`-s`  
&nbsp;&nbsp;&nbsp;&nbsp; Add styles to a new component. This option is ignored if -f options is set.

`-t <TEMPLATE>`  
&nbsp;&nbsp;&nbsp;&nbsp; Create a component from the template with the name `<TEMPLATE>`. By default it is set to the "default" template.

`-d <DIRECTORY>`  
&nbsp;&nbsp;&nbsp;&nbsp; Create a component in the `<DIRECTORY>`. By default it is set to the current working directory.

`-l <LIFECYCLE_METHODS>`  
&nbsp;&nbsp;&nbsp;&nbsp; Add a given list of lifecycle methods. Methods should be given as a string that consits of method names separated by colons.

`-h <HANDLERS>`  
&nbsp;&nbsp;&nbsp;&nbsp; Add a given list of arrow functions. Handlers should be given as a string that consits of their names separated by colons.

`-m <METHODS>`  
&nbsp;&nbsp;&nbsp;&nbsp; Add a given list of methods. Methods should be given as a string that consits of their names separated by colons.

`<COMPONENT_NAME>`  
&nbsp;&nbsp;&nbsp;&nbsp; The name of a component that should be created written in camelcase.

`<PROPS>`  
&nbsp;&nbsp;&nbsp;&nbsp; A list of props that should be added to a component. Every prop should be written as a separate parameter and should consist of the name, propType and defaultProp separated by colons. If a defaultProp is not given the prop is considered as a required one.

### Examples
Create a directory with the SomeComponent component from the default template:
```shell
$ crc create SomeComponent
```
Create a directory with the SomeComponent component from the "some-template" template:
```shell
$ crc create -t some-template SomeComponent
```
Create a file component from the "some-template" template:
```shell
$ crc create -t some-template -f SomeComponent
```
Create a directory with the SomeComponent component from the "some-template" template adding styles:
```shell
$ crc create -t some-template -s SomeComponent
```
Create a directory with the SomeComponent component from the "default" template adding a given list of props:
```shell
$ crc create SomeComponent "somePropName:PropType:defalutValue"
```
Create a directory with the SomeComponent component from the "default" template adding a given list of lifecycle methods:
```shell
$ crc create -l "componentDidMount:componentWillUnmount" SomeComponent
```
Create a directory with the SomeComponent component from the "default" template adding a given list of handlers:
```shell
$ crc create -h "handleChange:handleClick" SomeComponent
```
Create the SomeComponent component with a given list of handlers:
```shell
$ crc create -m "handleChange:handleClick" SomeComponent
```
  
  
## crc config
Create, edit or delete local crc config files for different directories

### Synopsis
```shell
crc config <COMMAND> [<DIRECTORY>]
```
### Description
The command handles local config files. If there is no config file in PWD, it is going to be looked for in ancestor directories. The first file, that is found in a list of ancestor directories, is considered as the active local config. Config files are going to be edited in the default EDITOR.

### Commands
`create [<DIRECTORY>]`  
&nbsp;&nbsp;&nbsp;&nbsp; Create a local config file component. By default `<DIRECTORY>` is set to PWD

`edit`  
&nbsp;&nbsp;&nbsp;&nbsp; Edit the active local config file component if it exits.

`delete`  
&nbsp;&nbsp;&nbsp;&nbsp; Delete the active local config file component if it exits.

### Examples
Create a config file in a current directory:
```shell
$ crc config create 
```

Edit the active config file if it exists:
```shell
$ crc config edit 
```

Delete the active config file if it exists:
```shell
$ crc config delete 
```
  
  
## crc template
Create, read, update or delete templates

### Synopsis
```shell
crc template <COMMAND> [-n] [-j <JS_FILE_EXTENTION>] [-s <CSS_FILE_EXTENTION>] <TEMPLATE>
```
### Description
The command handles template files. Template files are going to be edited in the default EDITOR.

### Commands
`create <TEMPLATE>`  
&nbsp;&nbsp;&nbsp;&nbsp; Create a new template with the name `<TEMPLATE>`.  
&nbsp;&nbsp;&nbsp;&nbsp;**Options:**  
&nbsp;&nbsp;&nbsp;&nbsp;`-n`  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Create a template without opening its files in the EDITOR.

&nbsp;&nbsp;&nbsp;&nbsp;`-j <JS_FILE_EXTENTION>`  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Set the extention of a component template. By default it is set to "js".

&nbsp;&nbsp;&nbsp;&nbsp;`-s <CSS_FILE_EXTENTION>`  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Set the extention of a styles template. By default it is set to "css".

`copy <OLD_TEMPLATE> <NEW_TEMPLATE>`  
&nbsp;&nbsp;&nbsp;&nbsp; Copy files from the `<OLD_TEMPLATE>` to `<NEW_TEMPLATE>`.

`edit <TEMPLATE>`  
&nbsp;&nbsp;&nbsp;&nbsp; Edit files for the `<TEMPLATE>` if this template exits.

`delete <TEMPLATE>`  
&nbsp;&nbsp;&nbsp;&nbsp; Delete the `<TEMPLATE>` if this template exits.

### Examples
Create a new template:
```shell
$ crc template -j jsx -s sass create some_template
```

Edit the "some_template":
```shell
$ crc template edit some_template
```

Delete the "some_template":
```shell
$ crc config template delete some_template 
```
  
  
## crc help
Show help info

### Synopsis
```shell
crc help [<COMMAND>]
```
### Examples
Show version:
```shell
$ crc help version
```

Show usage info:
```shell
$ crc help usage
```

Show help info on the crc-create command:
```shell
$ crc help create 
```
