////
////  LoginSceneConfigurator.swift
////  marauderS
////
////  Created by somsak on 1/5/2568 BE.
////
//
//import Foundation
//
//protocol LoginSceneConfigurator {
//    func configured(
//        with viewModel: LoginSceneViewModel
//    ) -> LoginSceneViewController
//}
//
//final class DefaultLoginSceneConfigurator: LoginSceneConfigurator {
//    func configured(
//        with viewModel: LoginSceneViewModel
//    ) -> LoginSceneViewController {
//        var viewModel = viewModel
//        let viewController = LoginSceneViewController(
//            rootView: LoginSceneView(viewModel: viewModel)
//        )
//        let interactor = LoginSceneInteractor()
//        let presenter = LoginScenePresenter()
//        let router = LoginSceneRouter()
//        router.source = viewController
//        presenter.viewController = viewController
//        interactor.presenter = presenter
//        viewController.interactor = interactor
//        viewController.router = router
//        viewController.viewModel = viewModel
//        viewModel.delegate = viewController
//        return viewController
//    }
//}
