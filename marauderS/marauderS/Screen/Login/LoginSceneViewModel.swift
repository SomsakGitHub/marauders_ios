////
////  LoginSceneViewModel.swift
////  marauderS
////
////  Created by somsak on 1/5/2568 BE.
////
//
//import SwiftUI
//
//protocol LoginSceneViewModelDelegate: AnyObject {
////    func didSelectButton(_ sender: LoginSceneViewModelModel?)
//}
//
//protocol LoginSceneViewModel {
//    var delegate: LoginSceneViewModelDelegate? { get set }
////    var text: String { get }
////    var buttonText: String { get }
//}
//
//final class DefaultLoginSceneViewModel: LoginSceneViewModel {
//    var delegate: LoginSceneViewModelDelegate?
////    @Published private(set) var text: String
////    @Published private(set) var buttonText: String
//    
////    init(
////        text: String,
////        buttonText: String
////    ) {
////        self.text = text
////        self.buttonText = buttonText
////    }
//}

import Foundation
import RxSwift

class LoginSceneViewModel: ObservableObject {
    var isLoggedIn = true
    @Published var username: String = ""
    @Published var password: String = ""
    
    private let service = LoginService()
    private let disposeBag = DisposeBag()

//    func login() {
////        LoginAction(
////            parameters: LoginRequest(
////                username: username,
////                password: password
////            )
////        ).call { _ in
////            isLoggedIn = true
////            // Login successful, navigate to the Home screen
////        }
//        isLoggedIn = true
//    }
    
    func login(completion: @escaping (Bool) -> Void) {
        service.login(req: LoginReq(email: "", password: ""))
            .subscribe { res in
                completion(true)
            } onError: { error in
//                completion(.failure(error))
            }.disposed(by: disposeBag)

//        showProgressView = true
//        APIService.shared.login(credentials: credentials) { [unowned self](result:Result<Bool, Authentication.AuthenticationError>) in
//         showProgressView = false
//            switch result {
//            case .success:
//
//            case .failure(let authError):
//                credentials = Credentials()
//                error = authError
//                completion(false)
//            }
//        }
    }
}

