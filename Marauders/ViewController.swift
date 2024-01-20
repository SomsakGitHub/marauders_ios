//
//  ViewController.swift
//  Marauders
//
//  Created by somsak on 20/1/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTouch(_ sender: Any) {
        print("loginTouch")
        viewModel.testApi()
    }
    


}

