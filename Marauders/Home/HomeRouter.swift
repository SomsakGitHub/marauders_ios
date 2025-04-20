import UIKit

@objc protocol HomeRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

class HomeRouter {
    weak var viewController: HomeViewController?
    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
}

// MARK: Routing (navigating to other screens)

extension HomeRouter: HomeRoutingLogic {
    func otp() {
//        let vc = UIStoryboard(name: StoryboardName.otpViewController.rawValue, bundle: nil).instantiateInitialViewController() as? OtpViewController
//        vc?.flow = .register
//        source?.window?.rootViewController = vc
    }
}
