//
//  Lblextension.swift
//  MIOTAGS
//
//  Created by Dhanabal on 10/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

// Label Extension

extension UILabel{
    func lbl(name : String){
        self.text = name
        self.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        self.textColor = UIColor.black
    }
    
    func lbls( names : String){
        self.text = names
        self.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.textColor = UIColor.black
    }
    
    func lblssr( str : String){
        self.text = str
        self.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        self.textColor = UIColor.green
    }
    
    func setCustom(str:String){
        self.text = str
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = UIColor.black
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.numberOfLines = 6
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor().hexToColor(hex: "#0A1E65").cgColor
        self.textAlignment = .center
    }
}


