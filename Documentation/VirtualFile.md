# VirtualFile

A file reference

``` swift
public protocol VirtualFile
```

## Requirements

### name

The file name

``` swift
var name: Data
```

### size()

Gets the file size

``` swift
func size() throws -> UInt64
```

#### Returns

The size of `self`

### lastModified()

Gets the last file modification if available

``` swift
func lastModified() throws -> UInt64?
```

#### Returns

The time of last modification as milliseconds since the unix epoch if available

### sha512()

Gets a SHA-512 hash value of the file contents if available

``` swift
func sha512() throws -> Data?
```

#### Returns

The SHA-512 hash value of the file contents if available

### read(offset:​count:​)

Reads some bytes starting at the given offset

``` swift
func read(offset: UInt64, count: Int) throws -> Data
```

  - Discussion:
    
      - Behavior: All parameters **MUST** be valid for the current file size. This means that the function
        **MUST** fail if `offset + count > size`.
      - Idempotency: This function **MUST** be nullipotent. This means that calls to this function **MUST NOT**
        have any side effects.
      - Atomicity: This function **MUST** be atomic. This means that it either succeeds or fails without side
        effects (= the returned data are complete or not returned at all).

#### Parameters

  - offset: The offset to start the reading at (`0`-based)
  - count: The amount of bytes to read

#### Returns

The bytes read

### read()

Reads the contents of `self`

``` swift
func read() throws -> Data
```

  - Discussion:
    
      - Idempotency: This function **MUST** be nullipotent. This means that calls to this function **MUST NOT**
        have any side effects.
      - Atomicity: This function **MUST** be atomic. This means that it either succeeds or fails without side
        effects (= the returned data are complete or not returned at all).

#### Returns

The contents of `self`

### write(offset:​contents:​)

Writes some bytes starting at the given offset

``` swift
func write(offset: UInt64, contents: Data) throws
```

  - Discussion:
    
      - Behavior: All parameters **MUST** be valid for the current file size. This means that the function
        **MUST** fail if `offset > size`.
      - Idempotency: This function **MUST** be idempotent. This means that subsequent calls with the same
        arguments **MUST** result in the same state for the given file.
      - Atomicity: This function **MAY** be atomic, depending on the underlying implementation. If you need an
        atomic call, take a look at `write(contents: Data)`.

#### Parameters

  - offset: The offset to start the writing at (`0`-based)
  - contents: The file contents to write

### write(contents:​)

Replaces the contents of `self`

``` swift
func write(contents: Data) throws
```

  - Discussion:
    
      - Idempotency: This function **MUST** be idempotent. This means that subsequent calls with the same
        arguments **MUST** result in the same state for the given file.
      - Atomicity: This function **MUST** be atomic. This means that it either succeeds or fails without side
        effects (= the contents are written completely or not at all).

#### Parameters

  - contents: The new file contents to write

### resize(size:​)

Resizes the file to the given size

``` swift
func resize(size: UInt64) throws
```

  - Discussion:
    
      - Behavior: If the new size is smaller than the current size, the file is truncated to the new size. If the
        new size is greater than the current size, the file is expanded with zero bytes to match the new size.
      - Idempotency: This function **MUST** be idempotent. This means that subsequent calls with the same
        arguments **MUST** result in the same state for the given file.
      - Atomicity: This function **MUST** be atomic. This means that it either succeeds or fails without side
        effects (= a file is resized completely or not at all).

#### Parameters

  - size: The new file size
