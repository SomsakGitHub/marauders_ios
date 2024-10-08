//  Created by somsak on 8/10/2567 BE.

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .login
    
    enum eAppRoots {
        case login
        case home
    }
}
