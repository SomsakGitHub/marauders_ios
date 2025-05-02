//
//  LoginSceneViewModel.swift
//  marauderS
//
//  Created by somsak on 1/5/2568 BE.
//

import SwiftUI

protocol LoginSceneViewModelDelegate: AnyObject {
//    func didSelectButton(_ sender: LoginSceneViewModelModel?)
}

protocol LoginSceneViewModel {
    var delegate: LoginSceneViewModelDelegate? { get set }
//    var text: String { get }
//    var buttonText: String { get }
}

final class DefaultLoginSceneViewModel: LoginSceneViewModel {
    var delegate: LoginSceneViewModelDelegate?
//    @Published private(set) var text: String
//    @Published private(set) var buttonText: String
    
//    init(
//        text: String,
//        buttonText: String
//    ) {
//        self.text = text
//        self.buttonText = buttonText
//    }
}
