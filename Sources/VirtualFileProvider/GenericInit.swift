import Foundation


/// An invalid argument error
public struct InvalidArgument: Error {
    /// The name of the argument
    public let name: String
    /// A human readable and localized description of the error
    public let description: String
    /// The file where the error was raised
    public let file: StaticString
    /// The line where the error was raised
    public let line: Int
    
    /// Creates a new `InvalidArgument` error
    ///
    ///  - Parameters:
    ///     - name: The name of the argument
    ///     - description: A human readable and localized description of the error
    ///     - file: The file where the error was raised
    ///     - line: The line where the error was raised
    public init(name: String, _ description: String, file: StaticString = #file, line: Int = #line) {
        self.name = name
        self.description = description
        self.file = file
        self.line = line
    }
}


/// An argument
public class AnyArgument {
    /// The name of the argument
    public let name: String
    /// A human readable localized description of the argument
    public let description: String
    /// Whether the argument is an expert argument or not
    public let isExpert: Bool
    
    /// Creates a new `AnyArgument`
    ///
    ///  - Parameters:
    ///     - name: The name of the argument
    ///     - description: A human readable localized description of the argument
    ///     - isExpert: Whether the argument is an expert argument or not
    fileprivate init(name: String, description: String, isExpert: Bool) {
        self.name = name
        self.description = description
        self.isExpert = isExpert
    }
}


/// A path argument
public class PathArgument: AnyArgument {
    /// The path
    private(set) public var path: String
    
    /// Creates a new path argument
    ///
    ///  - Parameters:
    ///     - name: The name of the argument
    ///     - description: A human readable localized description of the argument
    ///     - isExpert: Whether the argument is an expert argument or not
    ///     - path: The example path
    public init(name: String, description: String, isExpert: Bool, example path: String) {
        self.path = path
        super.init(name: name, description: description, isExpert: isExpert)
    }
    
    /// Sets the path to a user defined value
    ///
    ///  - Parameter path: The user defined path to use as argument
    public func set(_ path: String) {
        self.path = path
    }
}


/// An URL argument
public class UrlArgument: AnyArgument {
    /// The URL
    private(set) public var url: URL
    
    /// Creates a new URL argument
    ///
    ///  - Parameters:
    ///     - name: The name of the argument
    ///     - description: A human readable localized description of the argument
    ///     - isExpert: Whether the argument is an expert argument or not
    ///     - url: The example URL
    public init(name: String, description: String, isExpert: Bool, example url: URL) {
        self.url = url
        super.init(name: name, description: description, isExpert: isExpert)
    }
    
    /// Sets the URL to a user defined value
    ///
    ///  - Parameter url: The user defined URL to use as argument
    public func set(_ url: URL) {
        self.url = url
    }
}


/// An email address argument
public class EmailArgument: AnyArgument {
    /// The email address
    private(set) public var email: String
    
    /// Creates a new email address argument
    ///
    ///  - Parameters:
    ///     - name: The name of the argument
    ///     - description: A human readable localized description of the argument
    ///     - isExpert: Whether the argument is an expert argument or not
    ///     - email: The example email address
    public init(name: String, description: String, isExpert: Bool, example email: String) {
        self.email = email
        super.init(name: name, description: description, isExpert: isExpert)
    }
    
    /// Sets the email address to a user defined value
    ///
    ///  - Parameter email: The user defined email address to use as argument
    public func set(_ email: String) {
        self.email = email
    }
}


/// A multiple choice argument
public class ChoiceArgument: AnyArgument {
    /// The valid choices
    public let choices: [String]
    /// The selected choice
    private(set) public var choice: Int
    
    /// Creates a new multiple choice argument
    ///
    ///  - Parameters:
    ///     - name: The name of the argument
    ///     - description: A human readable localized description of the argument
    ///     - isExpert: Whether the argument is an expert argument or not
    ///     - choices: The valid choices as human readable and localized strings
    ///     - choice: An example choice
    public init(name: String, description: String, isExpert: Bool, choices: [String], example choice: Int) {
        self.choices = choices
        self.choice = choice
        super.init(name: name, description: description, isExpert: isExpert)
    }
    
    /// Sets the choice to a user defined value
    ///
    ///  - Parameter choice: The user defined choice to use as argument
    public func set(_ choice: Int) throws {
        guard self.choices.indices.contains(choice) else {
            throw InvalidArgument(name: self.name, "Invalid choice (\(choice) out of \(self.choices.count - 1)")
        }
        self.choice = choice
    }
}


/// A password argument
public class PasswordArgument: AnyArgument {
    /// The password
    private(set) public var password: String
    
    /// Creates a new password argument
    ///
    ///  - Parameters:
    ///     - name: The name of the argument
    ///     - description: A human readable localized description of the argument
    ///     - isExpert: Whether the argument is an expert argument or not
    override public init(name: String, description: String, isExpert: Bool) {
        self.password = ""
        super.init(name: name, description: description, isExpert: isExpert)
    }
    
    /// Sets the password to a user defined value
    ///
    ///  - Parameter password: The user defined password to use as argument
    public func set(_ password: String) {
        self.password = password
    }
}


/// A generic initialization API for a virtual file provider
public protocol GenericInit {
    /// The arguments template
    var template: [AnyArgument] { get }
    
    /// Initializes the file provider with the given arguments
    ///
    ///  - Parameter arguments: The filled in arguments from `self.template`
    init(arguments: [AnyArgument]) throws
}
