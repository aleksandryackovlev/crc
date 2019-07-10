# CRC - Create React Component
An easy to use cli-tool that simplifies the process of creation of React components.

### Usage
```shell
crc <COMMAND> [<ARGUMENTS>] [<COMPONENT_NAME>]
```
These are command used in various situations:
### crc create
Create React component
#### Synopsis
```shell
crc create [-f] [-s] [-t <TEMPLATE>] [-d <DIRECTORY>] [ -l <LIFECYCLE_METHODS>]
    [-h <HANDLERS>] [-m <METHODS>] <COMPONENT_NAME> [<PROPS>]
```
#### Description
If a placeholder for an option is not defined in a template, it will not appear in the resulting file even if it is set in the command.
#### Options
**-f**
Create a file component.

**-s**
Add a styles to the component. Create a component from the template with the name <TEMPLATE>. By default it is set to a "default" template.

**-d <DIRECTORY>**
Create component in a <DIRECTORY>. By default it is set to the current working directory.

**-l <LIFECYCLE_METHODS>**
Add a given list of lifecycle methods. Methods should be given as a string that consits of method names separated by colons.

**-h <HANDLERS>**
Add a given list of arrow functions. Handlers should be given as a string that consits of their names separated by colons.

**-m <METHODS>**
Add a given list of methods. Handlers should be given as a string that consits of their names separated by colons.

**<COMPONENT_NAME>**
The name of a component that should be created written in camelcase.

**<PROPS>**
A list of props that should be added to a component. Every props should be written a separate parameter and should consist of a name, propType and defaultProp separated by colons. If a defaultProp is not given the prop is considered as a required one.

#### Examples
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




### crc template
Create, read, update or delete templates

```shell
crc template list
crc template create templateName
crc template edit templateName
crc template delete templateName
```


### crc config
Create, edit or delete local crc config files for different directories

```shell
crc config create
crc config edit
crc config delete
```


### crc help
Show help info

```shell
crc help
crc help usage
crc help version
```
