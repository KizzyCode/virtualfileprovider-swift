# InvalidArgument

An invalid argument error

``` swift
public struct InvalidArgument: Error
```

## Inheritance

`Error`

## Initializers

### `init(name:_:file:line:)`

Creates a new `InvalidArgument` error

``` swift
public init(name: String, _ description: String, file: StaticString = #file, line: Int = #line)
```

#### Parameters

  - name: The name of the argument
  - description: A human readable and localized description of the error
  - file: The file where the error was raised
  - line: The line where the error was raised

## Properties

### `name`

The name of the argument

``` swift
let name: String
```

### `description`

A human readable and localized description of the error

``` swift
let description: String
```

### `file`

The file where the error was raised

``` swift
let file: StaticString
```

### `line`

The line where the error was raised

``` swift
let line: Int
```
