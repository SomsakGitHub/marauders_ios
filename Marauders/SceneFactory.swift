import UIKit

protocol SceneFactory {
    var loginConfigurator: LoginConfigurator! { get set }
}

final class DefaultSceneFactory: SceneFactory {
    
    static let shared = DefaultSceneFactory()
    
    var loginConfigurator: LoginConfigurator!
    
    func makeScene(scene: Scene) -> UIViewController {
        switch scene {
        case .login:
            loginConfigurator = DefaultLoginConfigurator(sceneFactory: DefaultSceneFactory.shared)
            let viewController = LoginViewController()
            return loginConfigurator.configured(viewController)
        }
    }
}
