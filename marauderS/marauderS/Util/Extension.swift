//
//  Extension.swift
//  marauderS
//
//  Created by somsak on 30/4/2568 BE.
//

import Alamofire

extension String {
    func toDictionary() -> [String: Any]? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}

extension Dictionary where Key == String, Value == String {
    func toHeader() -> HTTPHeaders {
        let headers = map({ HTTPHeader(name: $0.key, value: $0.value)})
        return HTTPHeaders(headers)
    }
}
