import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var emailTextFieldView: CustomTextFieldView!
    @IBOutlet weak var passwordTextFieldView: CustomTextFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextFieldView.config(type: .email)
        passwordTextFieldView.config(type: .password)
    }
    
    @IBAction func loginTouch(_ sender: Any) {
        setWindowRootView(storyboardName: .home)
    }
}
