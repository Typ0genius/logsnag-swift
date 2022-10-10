import Foundation

/// Options for publishing LogSnag events
public struct PublishOptions: Codable, Equatable {
    let channel: String
    let description: String?
    let event: String
    let icon: String?
    let notify: Bool?
    let tags: [String: TagValueTypes]?
    var project: String?

    /// Creates a `PublishOptions` object to send to LogSnag
    /// - Parameters:
    ///   - channel: Channel name
    ///   - event: Event name
    ///   - description: Event description (default `nil`)
    ///   - icon: Event icon (emoji)  (default `nil`)
    ///   - notify: Send push notification  (default `nil`)
    ///   - tags: Event tags  (default `nil`)
    public init(
        channel: String,
        event: String,
        description: String? = nil,
        icon: String? = nil,
        notify: Bool? = nil,
        tags: [String: TagValueTypes]? = nil
    ) {
        self.channel = channel
        self.event = event
        self.description = description
        self.icon = icon
        self.notify = notify
        self.tags = tags
    }
}

public enum TagValueTypes: Codable, Equatable {
    case bool(Bool)
    case integer(Int)
    case string(String)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .integer(let value):
            try container.encode(value)
        case .bool(let value):
            try container.encode(value)
        }
    }
}
