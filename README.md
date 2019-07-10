 # CRC - Create React Component
An easy to use cli-tool that simplifies the process of creation of React components.

## crc create
Create React component
### Synopsis
```shell
crc create [-f] [-s] [-t <TEMPLATE>] [-d <DIRECTORY>] [ -l <LIFECYCLE_METHODS>]
    [-h <HANDLERS>] [-m <METHODS>] <COMPONENT_NAME> [<PROPS>]
```
### Description
If a placeholder for an option is not defined in a template, it will not appear in the resulting file even if it is set in the command.
### Options
**-f**  
&nbsp;&nbsp;&nbsp;&nbsp; Create a file component.

**-s**  
&nbsp;&nbsp;&nbsp;&nbsp; Add a styles to the component. Create a component from the template with the name <TEMPLATE>. By default it is set to a "default" template.

**-d <DIRECTORY>**  
&nbsp;&nbsp;&nbsp;&nbsp; Create component in a <DIRECTORY>. By default it is set to the current working directory.

**-l <LIFECYCLE_METHODS>**  
&nbsp;&nbsp;&nbsp;&nbsp; Add a given list of lifecycle methods. Methods should be given as a string that consits of method names separated by colons.

**-h <HANDLERS>**  
&nbsp;&nbsp;&nbsp;&nbsp; Add a given list of arrow functions. Handlers should be given as a string that consits of their names separated by colons.

**-m <METHODS>**  
&nbsp;&nbsp;&nbsp;&nbsp; Add a given list of methods. Handlers should be given as a string that consits of their names separated by colons.

**<COMPONENT_NAME>**  
&nbsp;&nbsp;&nbsp;&nbsp; The name of a component that should be created written in camelcase.

**< PROPS>**  
&nbsp;&nbsp;&nbsp;&nbsp; A list of props that should be added to a component. Every props should be written a separate parameter and should consist of a name, propType and defaultProp separated by colons. If a defaultProp is not given the prop is considered as a required one.

### Examples
Create a directory with a SomeComponent component from the default template:
```shell
$ crc create SomeComponent
```
Create a directory with a SomeComponent component from the "some-template" template:
```shell
$ crc create -t some-template SomeComponent
```
Create a file component from the "some-template" template:
```shell
$ crc create -t some-template -f SomeComponent
```
Create a directory with a SomeComponent component from the "some-template" template adding styles:
```shell
$ crc create -t some-template -s SomeComponent
```
Create a directory with a SomeComponent component from the "default" template adding a given list of props:
```shell
$ crc create SomeComponent "somePropName:PropType:defalutValue"
```
Create a directory with a SomeComponent component from the "default" template adding a given list of lifecycle methods:
```shell
$ crc create -l "componentDidMount:componentWillUnmount" SomeComponent
```
Create a directory with a SomeComponent component from the "default" template adding a given list of handlers:
```shell
$ crc create -h "handleChange:handleClick" SomeComponent
```
Create a SomeComponent component with a given list of handlers:
```shell
$ crc create -m "handleChange:handleClick" SomeComponent
```

## crc config
Create, edit or delete local crc config files for different directories

### Synopsis
```shell
crc config <COMMAND>
```
### Description
The command handles local config files. If there is no config file in PWD, it is going to be looked for in ancestor directories. The first file, that is found in a list of ancestor directories, is considered as an active local config. Config files are going to be edited in the default EDITOR.

### Commands
**create [<DIRECTORY>]**  
&nbsp;&nbsp;&nbsp;&nbsp; Create a local config file component. By default <DIRECTORY> is set to PWD

**edit**  
&nbsp;&nbsp;&nbsp;&nbsp; Edit a local config file component if it exits.

**delete**  
&nbsp;&nbsp;&nbsp;&nbsp; Delete a local config file component if it exits.

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
### crc template
Create, read, update or delete templates

```shell
crc template list
crc template create templateName
crc template edit templateName
crc template delete templateName
```


### crc help
Show help info

```shell
crc help
crc help usage
crc help version
```
