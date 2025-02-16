import Foundation

public struct BaseResponseModel<T>: Codable where T: Codable {
    public let data: T?

    enum CodingKeys: String, CodingKey {
        case data = "data_value"
    }
}
