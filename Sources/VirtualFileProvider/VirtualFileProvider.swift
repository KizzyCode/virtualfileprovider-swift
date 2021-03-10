import Foundation


/// A virtual file provider entry
public enum Entry {
    /// A file entry
    case file(VirtualFile)
    /// A directory entry
    case directory(VirtualDirectory)
}


/// A file reference
public protocol VirtualFile {
    /// The file name
    var name: Data { get }
    
    /// Gets the file size
    ///
    ///  - Returns: The size of `self`
    func size() throws -> UInt64
    /// Gets the last file modification if available
    ///
    ///  - Returns: The time of last modification as milliseconds since the unix epoch if available
    func lastModified() throws -> UInt64?
    /// Gets a SHA-512 hash value of the file contents if available
    ///
    ///  - Returns: The SHA-512 hash value of the file contents if available
    func sha512() throws -> Data?
    
    /// Reads some bytes starting at the given offset
    ///
    ///  - Parameters:
    ///     - offset: The offset to start the reading at (`0`-based)
    ///     - count: The amount of bytes to read
    ///  - Returns: The bytes read
    ///
    ///  - Discussion:
    ///     - Behavior: All parameters __MUST__ be valid for the current file size. This means that the function
    ///       __MUST__ fail if `offset + count > size`.
    ///     - Idempotency: This function __MUST__ be nullipotent. This means that calls to this function __MUST NOT__
    ///       have any side effects.
    ///     - Atomicity: This function __MUST__ be atomic. This means that it either succeeds or fails without side
    ///       effects (= the returned data are complete or not returned at all).
    func read(offset: UInt64, count: Int) throws -> Data
    /// Reads the contents of `self`
    ///
    ///  - Returns: The contents of `self`
    ///
    ///  - Discussion:
    ///     - Idempotency: This function __MUST__ be nullipotent. This means that calls to this function __MUST NOT__
    ///       have any side effects.
    ///     - Atomicity: This function __MUST__ be atomic. This means that it either succeeds or fails without side
    ///       effects (= the returned data are complete or not returned at all).
    func read() throws -> Data
    
    /// Writes some bytes starting at the given offset
    ///
    ///  - Parameters:
    ///     - offset: The offset to start the writing at (`0`-based)
    ///     - contents: The file contents to write
    ///
    ///  - Discussion:
    ///     - Behavior: All parameters __MUST__ be valid for the current file size. This means that the function
    ///       __MUST__ fail if `offset > size`.
    ///     - Idempotency: This function __MUST__ be idempotent. This means that subsequent calls with the same
    ///       arguments __MUST__ result in the same state for the given file.
    ///     - Atomicity: This function __MAY__ be atomic, depending on the underlying implementation. If you need an
    ///       atomic call, take a look at `write(contents: Data)`.
    func write(offset: UInt64, contents: Data) throws
    /// Replaces the contents of `self`
    ///
    ///  - Parameters:
    ///     - contents: The new file contents to write
    ///
    ///  - Discussion:
    ///     - Idempotency: This function __MUST__ be idempotent. This means that subsequent calls with the same
    ///       arguments __MUST__ result in the same state for the given file.
    ///     - Atomicity: This function __MUST__ be atomic. This means that it either succeeds or fails without side
    ///       effects (= the contents are written completely or not at all).
    func write(contents: Data) throws
    
    /// Resizes the file to the given size
    ///
    ///  - Parameter size: The new file size
    ///
    ///  - Discussion:
    ///     - Behavior: If the new size is smaller than the current size, the file is truncated to the new size. If the
    ///       new size is greater than the current size, the file is expanded with zero bytes to match the new size.
    ///     - Idempotency: This function __MUST__ be idempotent. This means that subsequent calls with the same
    ///       arguments __MUST__ result in the same state for the given file.
    ///     - Atomicity: This function __MUST__ be atomic. This means that it either succeeds or fails without side
    ///       effects (= a file is resized completely or not at all).
    func resize(size: UInt64) throws
}


/// A directory reference
public protocol VirtualDirectory {
    /// The directory name or `nil` if `self` is the root directory
    var name: Data? { get }
    
    /// Lists entries in `self`
    ///
    ///  - Returns: A list of available files
    ///
    ///  - Discussion:
    ///     - Idempotency: This function __MUST__ be nullipotent. This means that calls to this function __MUST NOT__
    ///       have any side effects. However the results may change during subsequent calls if the underlying file tree
    ///       is modified.
    func list() throws -> [Data: Entry]
    
    /// Creates/opens a file
    ///
    ///  - Parameter name: The name of the file to create/open
    ///  - Returns: A reference to the created/opened file
    ///
    ///  - Discussion:
    ///     - Idempotency: This function __MUST__ be idempotent. This means that subsequent calls with the same
    ///       arguments __MUST__ result in the same state for the given file.
    ///     - Atomicity: This function __MUST__ be atomic. This means that it either succeeds or fails without side
    ///       effects.
    func create(file name: Data) throws -> VirtualFile
    /// Creates/opens a directory
    ///
    ///  - Parameter name: The name of the directory to create/open
    ///  - Returns: A reference to the newly created/opened directory
    ///
    ///  - Discussion:
    ///     - Idempotency: This function __MUST__ be idempotent. This means that subsequent calls with the same
    ///       arguments __MUST__ result in the same state for the given file.
    ///     - Atomicity: This function __MUST__ be atomic. This means that it either succeeds or fails without side
    ///       effects.
    func create(directory name: Data) throws -> VirtualDirectory
    
    /// Deletes an entry
    ///
    ///  - Parameter name: The name of the entry to delete
    ///
    ///  - Discussion:
    ///     - Idempotency: This function __MUST__ be idempotent. This means that subsequent calls with the same
    ///       arguments __MUST__ result in the same state for the given file.
    ///     - Atomicity: This function __MUST__ be atomic. This means that it either succeeds or fails without side
    ///       effects (= a file is either deleted completely or not at all).
    func delete(name: Data) throws
}


/// A virtual file provider
public protocol VirtualFileProvider {
    /// The root directory
    var root: VirtualDirectory { get }
}
