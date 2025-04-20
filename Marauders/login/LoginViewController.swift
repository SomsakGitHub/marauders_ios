import UIKit

protocol LoginViewControllerInput: AnyObject {
    func loginSuccess()
}

protocol LoginViewControllerOutput: AnyObject {
    func login(req: LoginReq)
}

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var emailTextFieldView: CustomTextFieldView!
    @IBOutlet weak var passwordTextFieldView: CustomTextFieldView!
    
    var interactor: LoginInteractorInput?
    var router: LoginRoutingLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextFieldView.config(type: .email)
        passwordTextFieldView.config(type: .password)
    }
    
    @IBAction func loginTouch(_ sender: Any) {
//        let loginReq = LoginReq(email: emailTextFieldView.textField.text ?? "", password: passwordTextFieldView.textField.text ?? "")
//        interactor?.login(req: loginReq)
        setWindowRootView(storyboardName: .home)
    }
}

extension LoginViewController: LoginViewControllerInput {
    func loginSuccess() {
        setWindowRootView(storyboardName: .home)
    }
}
