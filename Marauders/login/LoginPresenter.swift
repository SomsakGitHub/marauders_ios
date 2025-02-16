import Foundation

typealias LoginPresenterInput = LoginInteractorOutput
typealias LoginPresenterOutput = LoginViewControllerInput

class LoginPresenter {
    weak var viewController: LoginPresenterOutput?
}

extension LoginPresenter: LoginPresenterInput {
    func loginSuccess(data: LoginRes?) {
        viewController?.loginSuccess()
    }
}
