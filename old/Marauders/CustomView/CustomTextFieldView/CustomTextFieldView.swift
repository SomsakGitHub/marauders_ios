import UIKit

@IBDesignable
class CustomTextFieldView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var textField: UITextField!
    
    enum CustomTextFieldType {
        case email
        case password
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: NibName.customTextFieldView.rawValue, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first
        return nibView as? UIView ?? UIView()
    }
    
    func config(type: CustomTextFieldType) {
        switch type {
        case .email:
            self.textField.placeholder = "email"
        case .password:
            self.textField.placeholder = "password"
        }
    }
}
