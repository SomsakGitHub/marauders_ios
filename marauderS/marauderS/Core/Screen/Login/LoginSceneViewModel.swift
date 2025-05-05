//
//  LoginSceneViewModel.swift
//  marauderS
//
//  Created by somsak on 1/5/2568 BE.

import Foundation
import RxSwift

class LoginSceneViewModel: ObservableObject {
    var isLoggedIn = true
    @Published var username: String = ""
    @Published var password: String = ""
    
    private let service = LoginService()
    private let disposeBag = DisposeBag()
    
    func login(completion: @escaping (Bool) -> Void) {
        service.login(req: LoginReq(email: "", password: ""))
            .subscribe { res in
                completion(true)
            } onError: { error in
//                completion(.failure(error))
            }.disposed(by: disposeBag)
    }
}

