//
//  Item.swift
//  Marauders
//
//  Created by somsak on 8/1/2568 BE.
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
