//
//  BaseViewModel.swift
//  CoreKit
//
//  Created by somsak on 20/1/2567 BE.
//

import Foundation

open class BaseViewModel: NSObject {
    public var errorCallback: ((String) -> Void)?
    public var startLoading: (() -> Void)?
    public var stopLoading: (() -> Void)?
    public var shouldReloadView: (() -> Void)?
    
     //MARK: - Handle main `API` in each tab
     /*
     1. feed
     2. portfolio
     3. notification
     4. setting (portfolio)
     */
    public var onMainApiError: (() -> Void)?
    
    public var isLoading: Bool = false {
        didSet {
            if isLoading {
                startLoading?()
            } else {
                stopLoading?()
            }
        }
    }
}
