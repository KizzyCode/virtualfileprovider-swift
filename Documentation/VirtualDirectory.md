# VirtualDirectory

A directory reference

``` swift
public protocol VirtualDirectory
```

## Requirements

### name

The directory name or `nil` if `self` is the root directory

``` swift
var name: Data?
```

### list()

Lists entries in `self`

``` swift
func list() throws -> [Data: Entry]
```

  - Discussion:
    
      - Idempotency: This function **MUST** be nullipotent. This means that calls to this function **MUST NOT**
        have any side effects. However the results may change during subsequent calls if the underlying file tree
        is modified.

#### Returns

A list of available files

### create(file:​)

Creates/opens a file

``` swift
func create(file name: Data) throws -> VirtualFile
```

  - Discussion:
    
      - Idempotency: This function **MUST** be idempotent. This means that subsequent calls with the same
        arguments **MUST** result in the same state for the given file.
      - Atomicity: This function **MUST** be atomic. This means that it either succeeds or fails without side
        effects.

#### Parameters

  - name: The name of the file to create/open

#### Returns

A reference to the created/opened file

### create(directory:​)

Creates/opens a directory

``` swift
func create(directory name: Data) throws -> VirtualDirectory
```

  - Discussion:
    
      - Idempotency: This function **MUST** be idempotent. This means that subsequent calls with the same
        arguments **MUST** result in the same state for the given file.
      - Atomicity: This function **MUST** be atomic. This means that it either succeeds or fails without side
        effects.

#### Parameters

  - name: The name of the directory to create/open

#### Returns

A reference to the newly created/opened directory

### delete(name:​)

Deletes an entry

``` swift
func delete(name: Data) throws
```

  - Discussion:
    
      - Idempotency: This function **MUST** be idempotent. This means that subsequent calls with the same
        arguments **MUST** result in the same state for the given file.
      - Atomicity: This function **MUST** be atomic. This means that it either succeeds or fails without side
        effects (= a file is either deleted completely or not at all).

#### Parameters

  - name: The name of the entry to delete
