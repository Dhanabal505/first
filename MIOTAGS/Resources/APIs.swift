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
    static let ASSET = "api/qrcode/searchasset"
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
   
    Alamofire.request(BASE_PATH+PATH.LOGIN, method: .post, parameters: data).responseJSON { (response) in
        print("response  - ",response)
        
        if let result = response.value{
            if let dicData = result as? NSDictionary{
                if dicData["token_type"] != nil{
                    if (dicData["token_type"] as! String) == "bearer"{
                        
                        var accessToken = ""
                        var tokenType = ""
                        var userName = ""
                        var Role = ""
                        var companyname = ""
                        var customername = ""
                        var userid = ""
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
                        if let str = dicData["IsPrimaryUser"] as? String{
                            Role = str
                        }
                        if let str = dicData["CompanyName"] as? String{
                            companyname = str
                        }
                        if let str = dicData["CustomerName"] as? String{
                            customername = str
                        }
                        if let str = dicData["userId"] as? String{
                            userid = str
                        }
                        if let str = dicData["MobileNo"] as? String{
                            mobile = str
                        }
                        
                        let access = "\(tokenType) \(accessToken)"
                        //                            print("accesstike - \(access)")
                        
                       
                        Model.setUserdefault(strTitle: STRING.ACCESS_TOKEN, value: access)
                        
                        
                        let user = User(username: userName, Role: Role, companyname: companyname, customername: customername,userid: userid, MobileNo: mobile)
                        
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

    public static func asset(data:[String:String],completion:@escaping(Any?,ErrorHandler?)->Void){
        
        Alamofire.request(BASE_PATH+PATH.ASSET, method: .get, parameters: data, headers:HeaderWithToken).responseJSON { (response) in
            print("response -" ,response)
            
            if let result = response.value{
                if let dicData = result as? NSDictionary{
                    if dicData["statuscode"] != nil{
                        if (dicData["statuscode"] as! String) == "1"{
                            if dicData["data"] != nil{
                             
                               
                                
                                
                                let mydata = dicData["data"] as? NSDictionary
                                
                                    var statuscode = ""
                                    var Address = ""
                                    var Ano = ""
                                    var Aseos = ""
                                    var Banyos = ""
                                    var CarpExtr = ""
                                    var CarpInt = ""
                                    var City = ""
                                    var ComInc = ""
                                    var Country = ""
                                    var Estado = ""
                                    var Habitac = ""
                                    var Latitude = ""
                                    var Longitude = ""
                                    var M2Utilis = ""
                                    var M2cons = ""
                                    var Occupado = ""
                                    var Owner = ""
                                    var PropertyId = ""
                                    var RefCatastral = ""
                                    var Situaction = ""
                                    var State = ""
                                    var Tipo = ""
                                    var Tipologia = ""
                                    var ZipCode = ""
                                    var companyid = ""
                                    var prprtyweb = ""
                                
                                if let str = dicData["statuscode"] as? String{
                                        statuscode = str
                                    }
                                if let str = mydata!["Address"] as? String{
                                        Address = str
                                    }
                                if let str = mydata!["Ano"] as? String{
                                        Ano = str
                                    }
                                if let str = mydata!["Aseos"] as? String{
                                        Aseos = str
                                    }
                                    if let str = mydata!["Banyos"] as? String{
                                        Banyos = str
                                    }
                                    if let str = mydata!["CarpExtr"] as? String{
                                        CarpExtr = str
                                    }
                                    if let str = mydata!["CarpInt"] as? String{
                                        CarpInt = str
                                    }
                                    if let str = mydata!["City"] as? String{
                                        City = str
                                    }
                                    if let str = mydata!["ComInc"] as? String{
                                        ComInc = str
                                    }
                                    if let str = mydata!["Country"] as? String{
                                        Country = str
                                    }
                                    if let str = mydata!["Estado"] as? String{
                                        Estado = str
                                    }
                                    if let str = mydata!["Habitac"] as? String{
                                        Habitac = str
                                    }
                                    if let str = mydata!["Latitude"] as? String{
                                        Latitude = str
                                    }
                                    if let str = mydata!["Longitude"] as? String{
                                        Longitude = str
                                    }
                                    if let str = mydata!["M2Utilis"] as? String{
                                        M2Utilis = str
                                    }
                                    if let str = mydata!["M2cons"] as? String{
                                        M2cons = str
                                    }
                                    if let str = mydata!["Occupado"] as? String{
                                        Occupado = str
                                    }
                                    if let str = mydata!["Owner"] as? String{
                                        Owner = str
                                    }
                                    if let str = mydata!["PropertyId"] as? String{
                                        PropertyId = str
                                    }
                                    if let str = mydata!["RefCatastral"] as? String{
                                        RefCatastral = str
                                    }
                                    if let str = mydata!["Situaction"] as? String{
                                        Situaction = str
                                    }
                                    if let str = mydata!["State"] as? String{
                                        State = str
                                    }
                                    if let str = mydata!["Tipo"] as? String{
                                        Tipo = str
                                    }
                                    if let str = mydata!["Tipologia"] as? String{
                                        Tipologia = str
                                    }
                                    if let str = mydata!["ZipCode"] as? String{
                                        ZipCode = str
                                    }
                                    if let str = mydata!["companyid"] as? String{
                                        companyid = str
                                    }
                                
                                if let str = mydata!["prpertywebsite"] as? String{
                                    prprtyweb = str
                                }
                                
//                                print(statuscode)
                                print("StatusCode\(statuscode)")

                                let Assets = Asset(statuscode: statuscode, Address: Address, Ano: Ano, Aseos: Aseos, Banyos: Banyos, CarpExtr: CarpExtr, CarpInt: CarpInt, City: City, ComInc: ComInc, Country: Country, Estado: Estado, Habitac: Habitac, Latitude: Latitude, Longitude: Longitude, M2Utilis: M2Utilis, M2cons: M2cons, Occupado: Occupado, Owner: Owner, PropertyId: PropertyId, RefCatastral: RefCatastral, Situaction: Situaction, State: State, Tipo: Tipo, Tipologia: Tipologia, ZipCode: ZipCode, companyid: companyid, prprtyweb: prprtyweb)
                                
                                completion(dicData["data"] as Any,nil)
                            }
                            }
                            else{
                                completion(nil,.noDataAvailable)
                            }
                            }else if dicData["status"] != nil{
                                if let message = dicData["message"] as? String{
                                    completion(message,nil)
                                }
                                else{
                                    completion(nil,.noDataAvailable)
                                }
                            }
                        }
                    }
                    else{
                        completion(nil,.connectionError)
                    }
            }
        }
    }


