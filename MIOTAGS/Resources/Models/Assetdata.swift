//
//  Assetdata.swift
//  MIOTAGS
//
//  Created by Dhanabal on 17/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

class Asset {
   static var statuscode : String!
   static var Address : String!
   static var Ano : String!
   static var Aseos : String!
   static var Banyos : String!
   static var CarpExtr : String!
   static var CarpInt : String!
   static var City : String!
   static var ComInc : String!
   static var Country : String!
   static var Estado : String!
   static var Habitac : String!
   static var Latitude : String!
   static var Longitude : String!
   static var M2Utilis : String!
   static var M2cons : String!
   static var Occupado : String!
   static var Owner : String!
   static var PropertyId : String!
   static var RefCatastral : String!
   static var Situaction : String!
   static var State : String!
   static var Tipo : String!
   static var Tipologia : String!
   static var ZipCode : String!
   static var companyid : String!
    
    init(statuscode: String,Address : String,Ano : String,Aseos : String,Banyos : String,CarpExtr : String,CarpInt : String,City : String,ComInc : String,Country : String,Estado : String,Habitac : String,Latitude : String,Longitude : String,M2Utilis : String,M2cons : String,Occupado : String,Owner : String,PropertyId : String,RefCatastral : String!,Situaction : String,State : String,Tipo : String,Tipologia : String,ZipCode : String,companyid : String) {
        
        Asset.statuscode = statuscode
        Asset.Address = Address
        Asset.Ano = Ano
        Asset.Aseos = Aseos
        Asset.Banyos = Banyos
        Asset.CarpExtr = CarpExtr
        Asset.CarpInt = CarpInt
        Asset.City = City
        Asset.ComInc = ComInc
        Asset.Country = Country
        Asset.Estado = Estado
        Asset.Habitac = Habitac
        Asset.Latitude = Latitude
        Asset.Longitude = Longitude
        Asset.M2Utilis = M2Utilis
        Asset.M2cons = M2cons
        Asset.Occupado = Occupado
        Asset.Owner = Owner
        Asset.PropertyId = PropertyId
        Asset.RefCatastral = RefCatastral
        Asset.Situaction = Situaction
        Asset.State = State
        Asset.Tipo = Tipo
        Asset.Tipologia = Tipologia
        Asset.ZipCode = ZipCode
        Asset.companyid = companyid
    }
}

class Models{
    
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
