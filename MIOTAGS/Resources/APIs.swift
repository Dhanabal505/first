//
//  APIs.swift
//  MIOTAGS
//
//  Created by Dhanabal on 09/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.


import Foundation
import UIKit
import Alamofire

struct SERVER {
     static let BASE_URL = "http://18.218.2.141:90/"
}
struct PATH {
    static let LOGIN = "userlogin"
    static let ASSET = "api/qrcode/searchasset"
     static let FORGOT = "api/user/forgotpassword?email="
    static let UPLOAD_IMG = "api/qrcode/addphoto?assetId="
    static let PICNO = "&picno="
    static let CRNTLOCATION = "api/qrcode/addlocation"
    static let SUPPORT = "api/user/mysupport"
    static let HISTORY = "api/qrcode/searchhistory"
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
                        
                        
                        let user = User(username: userName, Role: Role, companyname: companyname, customername: customername,userid: userid, MobileNo: mobile, tokentype: tokenType)
                        
                        setAccessToken()
                        completion(user,nil)
                    }
                    else{
                        completion(nil,.noDataAvailable)
                    }
                }
                else{
                    
                    completion(nil,.invalidData)
                }
            }
            
        }
        else{
            completion(nil,.connectionError)
        }
    }
}
    
    public static func forgotPassword(strEmail:String,completion:@escaping(Any?,ErrorHandler?)->Void){
        
        Alamofire.request(BASE_PATH+PATH.FORGOT+"\(strEmail)", method: .post, parameters: [:], headers: ["Content-Type":"application/json"]).responseJSON { (response) in
            
            print(BASE_PATH+PATH.FORGOT+"\(strEmail)")
            print("response - \(response)")
            if let result = response.value{
                if let data = result as? NSDictionary{
                    if data["statuscode"] != nil && (data["statuscode"]as! String) == "1"{
                        if let message = data["message"]as? String{
                            let data = ["statuscode":"success","message":message] as! [String:Any]
                            completion(data,nil)
                        }
                        else{
                            completion(nil,.noDataAvailable)
                        }
                    }
                    else if data["statuscode"] != nil{
                        if let message = data["message"]as? String{
                            completion(message,nil)
                        }
                        else{
                            completion("Unable To Fetch Data",nil)
                        }
                    }
                    else{
                        completion(nil,.noDataAvailable)
                    }
                }
            }
            else{
                completion(nil,.connectionError)
            }
            
            
        }
    }
    
    public static func postAPI(path:String,data:[String:Any],completion:@escaping(Any?,ErrorHandler?)->Void){
         print("Path - \(path) - \(BASE_PATH)\(path)")
        Alamofire.request(BASE_PATH+path, method: .post, parameters: data,encoding: URLEncoding.queryString,headers:HeaderWithToken).responseJSON { (response) in
            print("response-", response)
            
            if let result = response.value{
                if let data = result as? NSDictionary{
                    if data["statuscode"] != nil{
                        if (data["statuscode"] as! String) == "1"{
                            if let message = data["message"]as? String{
                                print("Success")
                                
                                let myValue = ["statuscode":"success","message":message]
                                completion(myValue,nil)
                            }
                        }
                        else{
                            if let message = data["message"]as? String{
                                completion(message,nil)
                            }
                        }
                    }
                    else{
                        completion(nil,.noDataAvailable)
                    }
                }
            }
            else{
                completion(nil,.connectionError)
            }
        }
    }
    
    public static func History(data:[String:Any],completion:@escaping(Any?,ErrorHandler?)->Void){
        
        Alamofire.request(BASE_PATH+PATH.HISTORY, method: .get, parameters: data, headers:HeaderWithToken).responseJSON { (response) in
            print("response -" ,response)
    
            if let result = response.value{
                if let dicData = result as? NSDictionary{
                    if dicData["statuscode"] != nil{
                        if (dicData["statuscode"] as! String) == "1"{
                            if dicData["data"] != nil{
                                
                                completion(dicData["data"] as Any,nil)
                                
                                let data = dicData["data"] as! NSArray
                                
                                let mydata = Historydata(hdata: data)
                               
                                print("MYDATA\(data)")
                                
                            }
                        }
                        else{
                            completion(nil,.noDataAvailable)
                        }
                    }else if dicData["statuscode"] != nil{
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
    
   
    public static func asset(data:[String:String],completion:@escaping(Any?,ErrorHandler?)->Void){
        
        Alamofire.request(BASE_PATH+PATH.ASSET, method: .get, parameters: data, headers:HeaderWithToken).responseJSON { (response) in
            print("response -" ,response)
            
            if let result = response.value{
                if let dicData = result as? NSDictionary{
                    if dicData["statuscode"] != nil{
                        if (dicData["statuscode"] as! String) == "1"{
                            if dicData["data"] != nil{
                             
                               
                                
                                
                                let mydata = dicData["data"] as? NSDictionary
                                
                                
                                let images = mydata!["images"] as! NSArray
                                
                                let customfield = mydata!["customFields"] as! NSArray
                                
                                print(customfield)
                                
                                CustomValue.Value = customfield
                                
                                 let imgarr = NSMutableArray(array: images)
                                
                                
                              
                                
                                for picimg in imgarr{
                                 
                                    if let dict = (picimg as? NSDictionary){
                                       
                                    
                                        if let picno = dict.object(forKey: "picno") as? Int{
                                            
                                            if picno == 1 || picno == 2 || picno == 3 {
                                                
                                                var pic1 = ""
                                                var pic2 = ""
                                                var pic3 = ""
                                                
                                                if picno == 1 {
                                                    if let imgurl = dict.object(forKey: "pictureurl") as? String{
                                                        
                                                        let pic1str = imgurl
                                                        pic1 = pic1str
                                                        print(pic1)
                                                         let img = Images(image1: pic1)
                                                    }
                                                }
                                                if picno == 2 {
                                                    if let imgurls = dict.object(forKey: "pictureurl") as? String{
                                                        
                                                        let pic2str = imgurls
                                                        pic2 = pic2str
                                                        print(pic2)
                                                        let imgs = Imagess(image2: pic2)
                                                    }
                                                }
                                                if picno == 3 {
                                                    if let imgurlss = dict.object(forKey: "pictureurl") as? String{
                                                        
                                                        let pic3str = imgurlss
                                                        pic3 = pic3str
                                                        print(pic3)
                                                        let imgss = Imagesss(image3: pic3)
                                                    }
                                                }
                                            
                                               
                                               
                                                
                                                
                                            }
                                        }
                                        
                                    }
                                        
                                    }
                                    
                              
                                
                              
                         
                               
                                
                                
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
                                
                                   if let str = mydata!["prpertyWebsite"] as? String{
                                    prprtyweb = str
                                    }
                               
                                

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
    
    
    
    public static func location(data:[String:String],completion:@escaping(Any?,ErrorHandler?)->Void){
        
        Alamofire.request(BASE_PATH+PATH.CRNTLOCATION, method: .post, parameters: data,encoding: URLEncoding.queryString,headers:HeaderWithToken ).responseJSON { (response) in
            
            print("response  - ",response)
            
            if let result = response.value{
                if let dicData = result as? NSDictionary{
                    if dicData["statuscode"] != nil{
                        if (dicData["statuscode"] as! String) == "1"{
                            
                            
                        }
                            else{
                completion(nil,.noDataAvailable)
            }
        }
        else{
           
            completion(nil,.invalidData)
        }
    }
    
}
else{
    completion(nil,.connectionError)
}
        }
    }
    
    


    public static func uploadProfileImage(path:String,picno:String,image:UIImage,completion:@escaping(Any?,ErrorHandler?)->Void){
    
        let strUrl = BASE_PATH + path +  PATH.PICNO + "\(picno)"
        
        print(strUrl)
    
    let url = try! URLRequest(url: URL(string: strUrl)!, method: .post, headers: HeaderWithToken)
    
    let dataImage = image.jpegData(compressionQuality: 0.8)
        
        
     
    print("My Path - \(strUrl)")
    
    let filename="ProfileImage.jpg"
    
    Alamofire.upload(
        multipartFormData: { multipartFormData in
            multipartFormData.append(dataImage!, withName: "profile", fileName: filename, mimeType: "image/jpeg")
    },
        with: url,
        encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    if((response.result.value) != nil) {
                        
                        print("Response---\(response)")
                        let data = response.result.value as! NSDictionary
                        if data["statuscode"] != nil && (data["statuscode"]as! String) == "1" {
                            
                            if let message = data["message"] as? String{
                                let myData = ["statuscode":"success","message":message]
                                completion(myData,nil)
                            }
                            
                        }
                        else if data["statuscode"] != nil{
                            if let message = data["message"] as? String{
                                completion(message,nil)
                            }
                        }
                    } else {
                        completion(nil,.connectionError)
                        print("Error- \(response.value)")
                    }
                }
            case .failure( _):
                print("Error --")
                completion(nil,.noDataAvailable)
                break
            }
    }
    )
    
    
}




public static func getAPI(path:String,completion:@escaping(Any?,ErrorHandler?)->Void){
    
    Alamofire.request(BASE_PATH+path, method: .get, parameters: [:], headers: HeaderWithToken).responseJSON { (response) in
        print("Response Data - \(response)")
        if let result = response.value{
            if let dicData = result as? NSDictionary{
                if dicData["statuscode"] != nil && (dicData["statuscode"]as! String) == "1"{
                    if dicData["data"] != nil{
                        
                        let MyUser = dicData["data"] as! NSArray
                        print(MyUser)
                        
                        let Usrdata = NSMutableArray(array: MyUser)
                        
                        for UName in Usrdata{
                            
                            if let dict = (UName as? NSDictionary){
                                
                                
                                if let unamed = dict.object(forKey: "UserName") as? String{
                                    
                                    let Name = unamed
                                    Userlist.GETNAME.append(Name)
                                    print(Userlist.GETNAME)
                                }
                            }
                        }
                        completion(dicData["data"] as! Any,nil)
                    }
                                    
                    else{
                        completion(nil,.noDataAvailable)
                    }
                }
                else if dicData["statuscode"] != nil{
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
