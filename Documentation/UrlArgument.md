# UrlArgument

An URL argument

``` swift
public class UrlArgument: AnyArgument
```

## Inheritance

[`AnyArgument`](./AnyArgument)

## Initializers

### `init(name:description:isExpert:example:)`

Creates a new URL argument

``` swift
public init(name: String, description: String, isExpert: Bool, example url: URL)
```

#### Parameters

  - name: The name of the argument
  - description: A human readable localized description of the argument
  - isExpert: Whether the argument is an expert argument or not
  - url: The example URL

## Properties

### `url`

The URL

``` swift
var url: URL
```

## Methods

### `set(_:)`

Sets the URL to a user defined value

``` swift
public func set(_ url: URL)
```

#### Parameters

  - url: The user defined URL to use as argument
