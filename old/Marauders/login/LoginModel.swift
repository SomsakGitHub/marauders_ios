struct LoginReq {
    var email, password: String
}

struct LoginRes: Codable {
    let data: String
    
    enum CodingKeys: String, CodingKey {
        case data = "data_value"
    }
}
