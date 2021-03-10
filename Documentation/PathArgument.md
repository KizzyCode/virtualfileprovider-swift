# PathArgument

A path argument

``` swift
public class PathArgument: AnyArgument
```

## Inheritance

[`AnyArgument`](./AnyArgument)

## Initializers

### `init(name:description:isExpert:example:)`

Creates a new path argument

``` swift
public init(name: String, description: String, isExpert: Bool, example path: String)
```

#### Parameters

  - name: The name of the argument
  - description: A human readable localized description of the argument
  - isExpert: Whether the argument is an expert argument or not
  - path: The example path

## Properties

### `path`

The path

``` swift
var path: String
```

## Methods

### `set(_:)`

Sets the path to a user defined value

``` swift
public func set(_ path: String)
```

#### Parameters

  - path: The user defined path to use as argument
