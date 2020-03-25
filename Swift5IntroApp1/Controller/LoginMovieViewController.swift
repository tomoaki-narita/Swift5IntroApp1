//
//  LoginMovieViewController.swift
//  Swift5IntroApp1
//
//  Created by output. on 2020/03/25.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import UIKit

class LoginMovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    //navigationバーを消す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    
}
