//
//  MainUsecase.swift
//  Marauders
//
//  Created by somsak on 20/1/2567 BE.
//

import Foundation
import RxSwift
import RepositoryKit

final class MainUsecase {
    
    private let register = RegisterRepository()
    private let disposeBag = DisposeBag()
    
    func testApi(callback: @escaping (Result<TestApiModel, Error>) -> ()) {
        register
            .testApi()
            .subscribe { result in
                callback(.success(result))
            } onError: { (error) in
                callback(.failure(error))
            }.disposed(by: disposeBag)
    }
}
