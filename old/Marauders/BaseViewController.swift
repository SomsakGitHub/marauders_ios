import UIKit

class BaseViewController: UIViewController {
    let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BaseViewController")
    }
    
    func setWindowRootView(storyboardName: StoryboardName) {
        window?.rootViewController = UIStoryboard(name: storyboardName.rawValue, bundle: nil).instantiateInitialViewController()
    }
}
