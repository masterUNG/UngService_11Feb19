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
            showAlert(titleString: "Have Space", messageString: "Please Enter Every Blank")
        } else {
//            No Space
            print("No Space")
            
//            Upload To Server
            let myConstant = MyConstant()
            let urlString: String = myConstant.createUrlAddUser(name: name!, user: user!, password: password!)
            print(urlString)
            
            let objUrl = URL(string: urlString)
            let request = NSMutableURLRequest(url: objUrl!)
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                if error == nil {
                    
                    if let testData = data {
                        
                        let canReadable = NSString(data: testData, encoding: String.Encoding.utf8.rawValue)
                        print("canReadable ==> \(String(describing: canReadable))")
                        
                        if canReadable! == "true" {
                            print("Success Upload")
                            
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "BackAuthen", sender: self)
                            }
                            
                        } else {
                            print("Cannot Upload")
                        }
                    }
                }
            } // end task
            task.resume()
            
            
            
            
            
            
        }   // if
        
        
        
    }   // upload
    
    func showAlert(titleString: String, messageString: String) -> Void {
        
        let objAlert = UIAlertController(title: titleString, message: messageString, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        self.present(objAlert, animated: true, completion: nil)
        
        
    }   // showAlert
    
    
    

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "BackAuthen", sender: self)
        
    }
    

}   // Main Class
