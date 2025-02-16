enum NibName: String {
    case customTextFieldView = "CustomTextFieldView"
}

enum StoryboardName: String {
    case login = "Login"
    case home = "Home"
}

enum Scene {
    case login
}

enum ServicePath: String {
    case login = ""
}

enum Results<T> {
    case success(_ result: T?)
}

public enum ResponseStatusCode: String {
    case success = "200000"
}
