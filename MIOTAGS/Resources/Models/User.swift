//
//  User.swift
//  MIOTAGS
//
//  Created by Dhanabal on 09/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

class User{
    
    static var userName : String!
    static var CompanyName : String!
    static var Role : String!
    static var CustomerName : String!
    static var MobileNo : String?
    static var userId : String!
    static var tokentype : String?
    init(username:String,Role:String,companyname:String,customername:String,userid:String,MobileNo:String?,tokentype:String) {
        User.userName = username
        User.CompanyName = companyname
        User.Role = Role
        User.CustomerName = customername
        User.userId = userid
        User.tokentype = tokentype
        if MobileNo != nil{
            User.self.MobileNo = MobileNo
        }
    }
    
}

class Model{
    
    public static func setUserdefault(strTitle:String,value:String){
        UserDefaults.standard.set(value, forKey: strTitle)
    }
    public static func getUserdefault(strTitle:String)->String?{
        if let data = UserDefaults.standard.value(forKey: strTitle){
            return data as! String // as? String
        }
        return nil
    }
}
