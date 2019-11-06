//
//  LaunchScreen.swift
//  TestForDnepr
//
//  Created by Konstantin Chukhas on 04.11.2019.
//  Copyright © 2019 Konstantin Chukhas. All rights reserved.
//

import Foundation
import UIKit
class LaunchScreen:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
