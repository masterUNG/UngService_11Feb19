//
//  AuthenViewController.swift
//  UngService11Feb
//
//  Created by MasterUNG on 11/2/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class AuthenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }   // viewDidload
    

    @IBAction func newRegister(_ sender: UIButton) {
        
        print("You Click New Register")
        performSegue(withIdentifier: "GoToRegister", sender: self)
        
    }
    
}   // Main Class
