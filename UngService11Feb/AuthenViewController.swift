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
            
            let myConstant = MyConstant()
            let urlString: String = myConstant.createUrlGetUser(user: user!)
            guard let url = URL(string: urlString) else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                
                guard let dataResponse = data, error == nil else {
                    return
                }
                
                do {
                    
                    let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                    guard let jsonArray = jsonResponse as? [[String: Any]] else {
                        return
                    }
                    
                    print(jsonArray[0])
                    for jsonDictionary in jsonArray {
                        guard let truePassword: String = jsonDictionary["Password"] as? String else {
                            return
                        }
                        if self.password! == truePassword {
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "SuccessLogin", sender: self)
                            }
                        } else {
                            DispatchQueue.main.async {
                                self.showAlert(titleString: "Password False", messageString: "Please Try Again Password False")
                            }
                        }
                    }
                    
                    
                } catch let myError {
                    print(myError)
                    DispatchQueue.main.async {
                        self.showAlert(titleString: "User False", messageString: "No \(self.user!) in my Database")
                    }
                }
                
                
                
                
            } // End Task
            task.resume()
        }   // if1
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
