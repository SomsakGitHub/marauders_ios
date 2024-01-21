//
//  AppMeta.swift
//  NetworkKit
//
//  Created by somsak on 21/1/2567 BE.
//

import Foundation

struct AppMeta: Encodable {
    let citizenId, requestDatetime, userName ,logSessionId, appVersion, osVersion, requestId: String?
    
    enum CodingKeys: String, CodingKey {
        case citizenId = "citizen_id"
        case requestDatetime = "request_datetime"
        case userName = "user_name"
        case logSessionId = "log_session_id"
        case appVersion = "app_version"
        case osVersion = "os_version"
        case requestId = "request_id"
        
    }
    
    init() {
        let date = Date()
        requestDatetime = "date.toFormat(format: .ddMMyyyyhhmmMeta)"
        citizenId = ""
        userName = "(AppVariable.shared.userName)"
        logSessionId = "(AppVariable.shared.guid)"
        appVersion = "AppInfo.shared.version"
        osVersion = "AppInfo.shared.osVersion"
        requestId = "UUID().uuidString.lowercased()"
    }
    
    func toJsonString() -> String?  {
        let encoder = JSONEncoder()
        let meta = AppMeta()
        if let data = try? encoder.encode(meta),
           let json = String(data: data, encoding: .utf8) {
            return json
        }
        return nil
    }
}
