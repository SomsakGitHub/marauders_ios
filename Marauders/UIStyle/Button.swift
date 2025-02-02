//
//  Button.swift
//  Marauders
//
//  Created by somsak02061 on 31/1/2568 BE.
//

import SwiftUI

struct CustomButton: View {
    private var style: Style?
    let action: () -> Void
    
    init(style: Style?, action: @escaping () -> Void) {
        self.style = style
        self.action = action
    }
    
    enum Style {
        case primary
        case secondary
    }
    
    var body: some View {
        switch style {
        case .primary:
            PrimaryButton(lebel: "PrimaryButton", action: self.action)
        case .secondary:
            SecondaryButton(lebel: "SecondaryButton", action: self.action)
        default:
            SecondaryButton(lebel: "SecondaryButton", action: self.action)
        }
    }
}

struct PrimaryButton: View {
    let action: () -> Void
    var label: String = ""

    init(lebel: String, action: @escaping () -> Void) {
        self.label = lebel
        self.action = action
    }
    
    var body: some View {
        Button(self.label){
            self.action()
        }.buttonStyle(OvalButtonStyle())
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
    }

}

struct SecondaryButton: View {
    let action: () -> Void
    var label: String = ""

    init(lebel: String, action: @escaping () -> Void) {
        self.label = lebel
        self.action = action
    }
    var body: some View {
        Button(self.label){
            self.action()
        }.buttonStyle(OvalButtonStyle())
    }
}

struct OvalButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}

#Preview {
    PrimaryButton(lebel: "PrimaryButton", action: {})
    SecondaryButton(lebel: "SecondaryButton", action: {})
}
