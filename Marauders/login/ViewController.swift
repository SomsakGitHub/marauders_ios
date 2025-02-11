import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var emailTextFieldView: CustomTextFieldView!
    @IBOutlet weak var passwordTextFieldView: CustomTextFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        text.accessibilityIdentifier = "login_id"
        emailTextFieldView.config(type: .email)
        passwordTextFieldView.config(type: .password)
    }
}

