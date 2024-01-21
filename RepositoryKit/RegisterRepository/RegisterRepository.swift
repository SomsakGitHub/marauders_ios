//
//  RegisterRepository.swift
//  RepositoryKit
//
//  Created by somsak on 21/1/2567 BE.
//

import Foundation
import RxSwift

public class RegisterRepository: BaseRepository {
    public func testApi() -> Observable<TestApiModel> {
        let service = RegisterService.testApi
        return sendRequest(service: service, type: TestApiModel.self)
    }
}

public class TestApiModel: BaseModel {
    public let resStatus: Bool
}

public protocol BaseModel: Codable {
    
}
