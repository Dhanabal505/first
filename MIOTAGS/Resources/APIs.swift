//
//  APIs.swift
//  MIOTAGS
//
//  Created by Dhanabal on 09/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

struct SERVER {
     static let BASE_URL = "http://18.218.2.141:90/"
}
struct PATH {
    static let LOGIN = "userlogin"
}

enum ErrorHandler:Error{
    case noDataAvailable
    case serverError
    case connectionError
    case invalidData
    case DataNotFound
}


class APIs{
    
    static var BASE_PATH = SERVER.BASE_URL
    

    static var HeaderWithToken = [String:String]()
    
    //MARK:- Functions
    
    public static func setAccessToken(){
        let access = Model.getUserdefault(strTitle: STRING.ACCESS_TOKEN)
        HeaderWithToken = ["Authorization": access!,"Content-Type":"application/json"] //"Content-type":"application/json"
    }

public static func login(data:[String:String],completion:@escaping(User?,ErrorHandler?)->Void){
    //        let data = [String:String]()
    Alamofire.request(BASE_PATH+PATH.LOGIN, method: .post, parameters: data).responseJSON { (response) in
        print("response  - ",response)
        
        if let result = response.value{
            if let dicData = result as? NSDictionary{
                if dicData["status"] != nil{
                    if (dicData["status"] as! String) == "1"{
                        
                        var accessToken = ""
                        var tokenType = ""
                        var userName = ""
                        var Role = ""
                        var companyname = ""
                        var customername = ""
                        var mobile : String?
                        
                        if let str = dicData["access_token"] as? String{
                            accessToken = str
                        }
                        if let str = dicData["token_type"] as? String{
                            tokenType = str
                        }
                        if let str = dicData["userName"] as? String{
                            userName = str
                        }
                        if let str = dicData["Role"] as? String{
                            Role = str
                        }
                        if let str = dicData["CompanyName"] as? String{
                            companyname = str
                        }
                        if let str = dicData["CustomerName"] as? String{
                            customername = str
                        }
                        if let str = dicData["MobileNo"] as? String{
                            mobile = str
                        }
                        
                        let access = "\(tokenType) \(accessToken)"
                        //                            print("accesstike - \(access)")
                        
                        Model.setUserdefault(strTitle: STRING.ACCESS_TOKEN, value: access)
                        
                        
                        let user = User(userName, Role: Role, companyname: companyname, customername: customername, MobileNo: mobile)
                        
                        setAccessToken()
                        completion(user,nil)
                    }
                    else{
                        completion(nil,.noDataAvailable)
                    }
                }
                else{
                    //                        print("Else e")
                    completion(nil,.invalidData)
                }
            }
            
        }
        else{
            completion(nil,.connectionError)
        }
    }
}
}
