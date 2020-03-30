//
//  Images.swift
//  MIOTAGS
//
//  Created by Dhanabal on 27/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

class Images{
    
    static var img1:String!
  
    
    init(image1:String) {
        
        Images.img1 = image1
      
    }
}
class Modelss{
    
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

class Imagess{
    
   
    static var img2:String!
    
    init(image2:String) {
        
        Imagess.img2 = image2
      
    }
}
class Modelsss{
    
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

class Imagesss{
    
    
    static var img3:String!
    
    init(image3:String) {
        
        Imagesss.img3 = image3
        
    }
}
class Modelssss{
    
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


class Historydata{
    
    
    static var HDATA:NSArray?
    
    init(hdata:NSArray) {
        
        Historydata.HDATA = hdata
        
    }
}
class HModels{
    
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
