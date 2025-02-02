//
//  TextField.swift
//  Marauders
//
//  Created by somsak02061 on 31/1/2568 BE.
//

import SwiftUI

enum StyleTextField {
    case emailField
    case secureTextField
    case plainField
    case phoneNumberField
}

struct CustomTextField: View {
    private var style: StyleTextField?
    
    init(style: StyleTextField?) {
        self.style = style
    }
    
    var body: some View {
        switch style {
        case .emailField:
            EmailField()
        case .secureTextField:
            SecureTextField()
        case .plainField:
            PlainField()
        case .phoneNumberField:
            PhoneNumberField()
        default:
            EmailField()
        }
    }
}

struct EmailField: View {
    @State private var email: String = ""
    var body: some View {
        TextField("Email", text: $email)
            .textFieldStyle(OvalTextFieldStyle())
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .padding()
    }
}

struct SecureTextField: View {
    @State private var password: String = ""
    var body: some View {
        SecureField("SecureField", text: $password)
            .textFieldStyle(OvalTextFieldStyle())
            .padding()
    }
}

struct PlainField: View {
    @State private var text: String = ""
    var body: some View {
        TextField("Text", text: $text)
            .textFieldStyle(OvalTextFieldStyle())
            .padding()
    }
}

struct PhoneNumberField: View {
    @State private var phoneNumber: String = ""

    var body: some View {
        TextField("Phone number", text: $phoneNumber)
            .textFieldStyle(OvalTextFieldStyle())
            .keyboardType(.numberPad)
            .padding()
            .onChange(of: phoneNumber) { old ,new in
                phoneNumber = formatPhoneNumber(new)
            }
    }

    func formatPhoneNumber(_ number: String) -> String {
        let digits = number.filter { $0.isNumber }
        let mask = "(XXX) XXX-XXXX"

        var result = ""
        var index = digits.startIndex

        for char in mask where index < digits.endIndex {
            if char == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(char)
            }
        }
        return result
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .border(.secondary)
            .padding(10)
    }
}

#Preview {
//    CustomTextField(style: .plainTextField)
    EmailField()
    SecureTextField()
    PlainField()
    PhoneNumberField()
}
