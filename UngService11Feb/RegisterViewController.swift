//
//  RegisterViewController.swift
//  UngService11Feb
//
//  Created by MasterUNG on 12/2/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
//    Explicit
    var name: String?
    var user: String?
    var password: String?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userTextField: UITextField!
        
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }   // Main Method
    
    
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        
//        Get Value From TextField
        name = nameTextField.text
        user = userTextField.text
        password = passwordTextField.text
        
//        Show Value From TextField on Console
        print("name ==> \(String(describing: name!))")
        print("user ==> \(user!)")
        print("password ==> \(password!)")
        
//        Check Space
        if (name!.count == 0) || (user!.count == 0) || (password!.count == 0){
//            Have Space
            print("Have Space")
            showAlert(title: "Have Space", message: "Please Enter Every Blank")
        } else {
//            No Space
            print("No Space")
        }
        
        
        
    }   // upload
    
    func showAlert(title: String, message: String) -> Void {
        
        let objAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        self.present(objAlert, animated: true, completion: nil)
        
        
    }   // showAlert
    
    
    

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "BackAuthen", sender: self)
        
    }
    

}   // Main Class
