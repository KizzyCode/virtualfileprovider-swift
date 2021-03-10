# EmailArgument

An email address argument

``` swift
public class EmailArgument: AnyArgument
```

## Inheritance

[`AnyArgument`](./AnyArgument)

## Initializers

### `init(name:description:isExpert:example:)`

Creates a new email address argument

``` swift
public init(name: String, description: String, isExpert: Bool, example email: String)
```

#### Parameters

  - name: The name of the argument
  - description: A human readable localized description of the argument
  - isExpert: Whether the argument is an expert argument or not
  - email: The example email address

## Properties

### `email`

The email address

``` swift
var email: String
```

## Methods

### `set(_:)`

Sets the email address to a user defined value

``` swift
public func set(_ email: String)
```

#### Parameters

  - email: The user defined email address to use as argument
