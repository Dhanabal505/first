//
//  DataModel.swift
//  MIOTAGS
//
//  Created by Dhanabal on 09/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

class DataModel{
    
    static var TagFlag = 0
    
    public static func setTabFlag(index:Int){
        self.TagFlag = index
    }
    
    
    //MARK:- Userdefault
    
    public static func setUserDefault(strKey:String,data:String){
        print("Set data - \(strKey) -- \(data)")
        UserDefaults.standard.set(data, forKey: strKey)
    }
    
    public static func getUserDefault(strKey:String)->String{
        var myData = ""
        if let userData = UserDefaults.standard.value(forKey: strKey){
            myData = userData as! String
        }
        
        print("Get Data - \(myData)")
        return myData
    }
    
    public static func removeUserDefault(){
        //        UserDefaults.standard.removeObject(forKey: str)
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            if key != STRING.ACCESS_TOKEN{
                defaults.removeObject(forKey: key)
            }
            
        }
    }
    
}

class JSONString{
    
    public static func getJSONString(json:[String:Any])->String{
        var str=""
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: [])
            if let string = String(data: data, encoding: String.Encoding.utf8) {
                str=string
            }
        } catch {
            print(error)
        }
        
        return str
    }
}
