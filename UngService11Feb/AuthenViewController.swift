//
//  AuthenViewController.swift
//  UngService11Feb
//
//  Created by MasterUNG on 11/2/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class AuthenViewController: UIViewController {
    
    var user: String?
    var password: String?
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }   // viewDidload
    
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        user = userTextField.text
        password = passwordTextField.text
        
        if (user!.count == 0) || (password!.count == 0) {
            showAlert(titleString: "Have Space", messageString: "Please Fill All Blank")
        } else {
            
        }
        
        
        
    }   // login
    
    func showAlert(titleString: String, messageString: String) -> Void {
        
        let alert = UIAlertController(title: titleString, message: messageString, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func newRegister(_ sender: UIButton) {
        
        print("You Click New Register")
        performSegue(withIdentifier: "GoToRegister", sender: self)
        
    }
    
}   // Main Class
