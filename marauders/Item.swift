//
//  Item.swift
//  Marauders
//
//  Created by somsak on 17/10/2567 BE.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
