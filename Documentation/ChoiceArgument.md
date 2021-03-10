# ChoiceArgument

A multiple choice argument

``` swift
public class ChoiceArgument: AnyArgument
```

## Inheritance

[`AnyArgument`](/AnyArgument)

## Initializers

### `init(name:description:isExpert:choices:example:)`

Creates a new multiple choice argument

``` swift
public init(name: String, description: String, isExpert: Bool, choices: [String], example choice: Int)
```

#### Parameters

  - name: The name of the argument
  - description: A human readable localized description of the argument
  - isExpert: Whether the argument is an expert argument or not
  - choices: The valid choices as human readable and localized strings
  - choice: An example choice

## Properties

### `choices`

The valid choices

``` swift
let choices: [String]
```

### `choice`

The selected choice

``` swift
var choice: Int
```

## Methods

### `set(_:)`

Sets the choice to a user defined value

``` swift
public func set(_ choice: Int) throws
```

#### Parameters

  - choice: The user defined choice to use as argument
