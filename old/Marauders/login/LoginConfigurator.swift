import UIKit

protocol LoginConfigurator {
    func configured(_ viewController: LoginViewController) -> LoginViewController
}

final class DefaultLoginConfigurator: LoginConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ viewController: LoginViewController) -> LoginViewController {
        
        sceneFactory.loginConfigurator = self
        
        let worker = LoginWorker(service: LoginService())
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter(sceneFactory: sceneFactory)
        router.source = viewController
        presenter.viewController = viewController
        interactor.presenter = presenter
        interactor.worker = worker
        viewController.interactor = interactor
        viewController.router = router
    
        return viewController
    }
}
