//
//  LoginSceneRouter.swift
//  marauderS
//
//  Created by somsak on 1/5/2568 BE.
//

import UIKit

protocol LoginSceneRoutingLogic {
    func showHome()
//    func showDetails(viewModel: DetailsSceneViewModel)
}

final class LoginSceneRouter: NSObject {
    weak var source: UIViewController?
    
    private let scenesFactory: ScenesFactory
    
    init(scenesFactory: ScenesFactory = DefaultScenesFactory()) {
        self.scenesFactory = scenesFactory
    }
}

extension LoginSceneRouter: LoginSceneRoutingLogic {
    func showHome() {
        
    }
    
//    func showDetails(viewModel: DetailsSceneViewModel) {
//        source?.navigationController?.pushViewController(
//            Bool.random()
//            ? scenesFactory.makeDetailsScene(viewModel: viewModel)
//            : scenesFactory.makeOtherScene(),
//            animated: true
//        )
//    }
}
