//
//  ViewController.swift
//  UngService11Feb
//
//  Created by MasterUNG on 11/2/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    Explicit
    let name: String = "Master UNG"
    let surname: String = "Phrombutr"
    var address = ["53", "Bangna14", "Bangkok", "10260"]
    var addressDic = ["email":"master@abc.com", "phone":"081-8595309"]
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var surnameLabel: UILabel!
        
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        Show View
        nameLabel.text = "Name: \(name)"
        surnameLabel.text = "Surname: \(surname)"
        addressLabel.text = "Address: \(address[0]) \(address[1]) \(address[2]) \(address[3])"
        emailLabel.text = addressDic["email"]
        phoneLabel.text = addressDic["phone"]
        
    }   // Main Method


}   // Main Class

