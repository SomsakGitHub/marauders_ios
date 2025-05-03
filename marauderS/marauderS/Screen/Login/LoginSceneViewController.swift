////
////  LoginSceneViewController.swift
////  marauderS
////
////  Created by somsak on 1/5/2568 BE.
////
//
//import UIKit
//import SwiftUI
//
//protocol LoginSceneViewControllerInput: AnyObject {
//    var router: LoginSceneRoutingLogic? { get set }
//    var viewModel: LoginSceneViewModel? { get set }
//}
//
//typealias LoginSceneViewControllerOutput = LoginSceneInteractorInput
//
//final class LoginSceneViewController: UIHostingController<LoginSceneView> {
//    var interactor: LoginSceneViewControllerOutput?
//    var router: LoginSceneRoutingLogic?
//    var viewModel: LoginSceneViewModel?
//}
//
//extension LoginSceneViewController: LoginSceneViewControllerInput {}
//
//extension LoginSceneViewController: LoginSceneViewModelDelegate {
//    func didSelectButton(_ sender: LoginSceneViewModel?) {
//        interactor?.details()
//    }
//}
