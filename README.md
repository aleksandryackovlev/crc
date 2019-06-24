# CRC - Create React Component
An easy to use cli-tool for creation React components

### crc create
Creates a new React component

```shell
crc create SomeComponent # create a directory with a component from a default template
crc create -t some-template SomeComponent # create a directory with a component from the some-template
crc create -t some-template -f SomeComponent # create a file component from the some-template
crc create -t some-template -s SomeComponent # create a directory with a component from the some-template adding styles
crc create -t some-template SomeComponent "somePropName:PropType:defalutValue" "somePropName:PropType:defalutValue" # create a directory with a component from the some-template with props
crc create -l "componentDidMount:componentWillUnmount" SomeComponent # create a component with given lifecycles
crc create -h "handleChange:handleClick" SomeComponent # create a component with given handlers
crc create -i SomeComponent # create component interactively
```


### crc template
Editing templates

```shell
crc template list
crc template create templateName
crc template edit templateName
crc template delete templateName
```


### crc config
Editing config files

```shell
crc config create
crc config edit
crc config delete
```


### crc help
Shows help info

```shell
crc help
crc help usage
crc help version
```
