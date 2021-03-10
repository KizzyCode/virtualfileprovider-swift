# PasswordArgument

A password argument

``` swift
public class PasswordArgument: AnyArgument
```

## Inheritance

[`AnyArgument`](./AnyArgument)

## Initializers

### `init(name:description:isExpert:)`

Creates a new password argument

``` swift
override public init(name: String, description: String, isExpert: Bool)
```

#### Parameters

  - name: The name of the argument
  - description: A human readable localized description of the argument
  - isExpert: Whether the argument is an expert argument or not

## Properties

### `password`

The password

``` swift
var password: String
```

## Methods

### `set(_:)`

Sets the password to a user defined value

``` swift
public func set(_ password: String)
```

#### Parameters

  - password: The user defined password to use as argument
