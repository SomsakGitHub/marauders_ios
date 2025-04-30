import Foundation
import UIKit

protocol LoginRoutingLogic {
    func otp()
}

class LoginRouter {
    
    weak var source: BaseViewController?
    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
}

// MARK: Routing (navigating to other screens)

extension LoginRouter: LoginRoutingLogic {
    func otp() {
//        let vc = UIStoryboard(name: StoryboardName.otpViewController.rawValue, bundle: nil).instantiateInitialViewController() as? OtpViewController
//        vc?.flow = .register
//        source?.window?.rootViewController = vc
    }
}
