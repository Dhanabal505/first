//
//  side.swift
//  MIOTAGS
//
//  Created by Dhanabal on 11/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//


import Foundation
import UIKit

class NavigationModel:NSObject{
    
    static var vcViewModel=UIViewController()
    static var navViewModel=[UIViewController]()
    
    public static func setNavController(vc:UIViewController){
        if navViewModel.last != vc{
            self.navViewModel.append(vc)
        }
    }
    public static func removeAllNavController(){
        self.navViewModel.removeAll()
    }
    
    //Validate OTP
    static var NavOTP=String()
    public static func setNavValidOTP(str:String){
        NavOTP = str
}
}
//Using Navigation
