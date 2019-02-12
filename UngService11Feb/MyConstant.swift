//
//  MyConstant.swift
//  UngService11Feb
//
//  Created by MasterUNG on 12/2/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import Foundation

class MyConstant {
    
    var url1: String = "https://www.androidthai.in.th/jo/addUserMaster.php?isAdd=true&Name="
    var url2: String = "&User="
    var url3: String = "&Password="
    
    func createUrlAddUser(name: String, user: String, password: String) -> String {
        let result: String = "\(url1)\(name)\(url2)\(user)\(url3)\(password)"
        return result
    }
    
    
    
    
    
}
