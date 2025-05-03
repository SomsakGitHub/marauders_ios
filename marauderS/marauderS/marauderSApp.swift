//
//  marauderSApp.swift
//  marauderS
//
//  Created by somsak on 30/4/2568 BE.
//

import SwiftUI

@main
//class AppDelegate: UIResponder, UIApplicationDelegate {}

struct marauderSApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    
    @StateObject var authentication = Authentication()

    var body: some View {
        if authentication.isValidated {
            HomeView().environmentObject(authentication)
        } else {
//            private lazy var scenesFactory: ScenesFactory = DefaultScenesFactory()
            //        guard let windowScene = (scene as? UIWindowScene) else {
            //            assertionFailure()
            //            return
            //        }
            //        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            //        window?.windowScene = windowScene
            //        window?.rootViewController = UINavigationController(
            //            rootViewController: scenesFactory.makeLoginScene()
            //        )
            //        window?.makeKeyAndVisible()
            
//            scenesFactory.makeLoginScene()
//            LoginSceneView(isLoggedIn: $isLoggedIn)
            LoginSceneView().environmentObject(authentication)
        }
    }
}

//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//    var window: UIWindow?
//    
//    private lazy var scenesFactory: ScenesFactory = DefaultScenesFactory()
//
//    func scene(
//        _ scene: UIScene,
//        willConnectTo session: UISceneSession,
//        options connectionOptions: UIScene.ConnectionOptions
//    ) {
//        guard let windowScene = (scene as? UIWindowScene) else {
//            assertionFailure()
//            return
//        }
//        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        window?.windowScene = windowScene
//        window?.rootViewController = UINavigationController(
//            rootViewController: scenesFactory.makeLoginScene()
//        )
//        window?.makeKeyAndVisible()
//    }
//}
