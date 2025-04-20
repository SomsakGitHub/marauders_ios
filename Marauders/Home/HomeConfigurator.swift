

import UIKit

protocol HomeConfigurator {
    func configured(_ viewController: HomeViewController) -> HomeViewController
}

final class DefaultHomeConfigurator: HomeConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ viewController: HomeViewController) -> HomeViewController {
        
//        sceneFactory.HomeConfigurator = self
        
//        let worker = HomeWorker(service: HomeService())
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter(sceneFactory: sceneFactory)
//        router.source = viewController
        presenter.viewController = viewController
        interactor.presenter = presenter
//        interactor.worker = worker
        viewController.interactor = interactor
        viewController.router = router
    
        return viewController
    }
}

