//
//  Constant.swift
//  MIOTAGS
//
//  Created by Dhanabal on 27/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

struct ValidEmailid{
    static var Mailid:String = ""
}
struct CustomValue{
    static var Value = NSArray()
}
struct Userlist{
    static var GETNAME = ["All"]
}
struct Noteslist{
    static var NOTES = NSArray()
}

struct SIZE{
    

    
    static let TXT_Height:CGFloat = 45
    static let LOGO_Height:CGFloat = 30
    static let Header_Height:CGFloat = 50
    static let LeftMenu_Height:CGFloat = 20
    static let RightMenu_Height:CGFloat = 25
    static let Login_Height:CGFloat = 80
    static let Send_Height:CGFloat = 65
    static let PVIEW_HEIGHT:CGFloat = 300
    static let SVIEW_HEIGHT:CGFloat = 250
    static let HISTXT_HEIGHT:CGFloat = 70
    static let SEARCH_HEIGHT:CGFloat = 50
    static let MENUBTN_HEIGHT:CGFloat = 80
    static let MENUICON_HEIGHT:CGFloat = 30
    static let TEXTVW_HEIGHT:CGFloat = 130
    static let DATAVIEW_HEIGHT:CGFloat = 80
    static let DATAIMG_HEIGHT:CGFloat = 40
    static let INFOTXT_HEIGHT:CGFloat = 60
    static let CELL_HEIGHT:CGFloat = 160
    static let CELL_WIDTH:CGFloat = 120
    
}

struct STRING {
    static let ACCESS_TOKEN = "access_token"
    static let FORGOTPASS = "api/user/forgotpassword"
    static let SUPPORT = "api/user/mysupport"
    static let IMAGE = "api/qrcode/addphoto"
    static let HISTORY = "api/qrcode/searchhistory"
    static let ADDNOTE = "api/qrcode/addnote"
    static let USERS = "api/user/getusers"
    static let SERVER_ERROR = "Unable to Fetch Data."
    static let INTERNET_CONNECTION = "Internet Connection Error"
    static let INVALID_USER = "Invalid User"
    static let NO_DATA = "Data not found"
}


//struct USERDEFAULT {
//    static let USERNAME = "username"
//    static let PASSWORD = "password"
//}
