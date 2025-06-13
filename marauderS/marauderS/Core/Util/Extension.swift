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

import CoreLocation

// Sample Paris Location
extension CLLocationCoordinate2D {
    static let moulinRouge: Self = .init(
        latitude: 48.884134,
        longitude: 2.332196
    )
    
    static let eiffelTower: Self = .init(
        latitude: 48.858258,
        longitude: 2.294488
    )
    
    static let arcDeTriomphe: Self = .init(
        latitude: 48.873776,
        longitude: 2.295043
    )
    static let gareDuNord: Self = .init(
        latitude: 48.880071,
        longitude: 2.354977
    )
    static let louvre: Self = .init(
        latitude: 48.861950,
        longitude: 2.336902
    )
    static let sacreCoeur: Self = .init(
        latitude: 48.886634,
        longitude: 2.343048
    )
    static let notreDame: Self = .init(
        latitude: 48.852972,
        longitude: 2.350004
    )
    static let pantheon: Self = .init(
        latitude: 48.845616,
        longitude: 2.345996
    )
}
