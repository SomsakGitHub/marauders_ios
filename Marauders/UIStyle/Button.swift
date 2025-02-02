//
//  Button.swift
//  Marauders
//
//  Created by somsak02061 on 31/1/2568 BE.
//

import SwiftUI

enum StyleButton {
    case primary
    case secondary
}

struct CustomButton: View {
    private var style: StyleButton?
    
    init(style: StyleButton?) {
        self.style = style
    }
    
    var body: some View {
        switch style {
        case .primary:
            Primary()
        case .secondary:
            Secondary()
        default:
            EmailField()
        }
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}

#Preview {
    CustomButton(style: .primary)
}
