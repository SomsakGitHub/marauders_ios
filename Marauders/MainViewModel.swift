//
//  MainViewModel.swift
//  Marauders
//
//  Created by somsak on 20/1/2567 BE.
//

import Foundation
import CoreKit

final class MainViewModel: BaseViewModel {
    private let usecase = MainUsecase()
    
    public func testApi(){
        print("testApi")
        
        usecase.testApi() { [weak self] result in
            switch result {
            case .success(let data):
                print("success")
            case .failure(let error):
                print("failure")
            }
        }
    }
    

}
