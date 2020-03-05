//
//  Viewextension.swift
//  MIOTAGS
//
//  Created by Dhanabal on 04/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func viewlayout(){
           self.backgroundColor = UIColor.white
           self.layer.borderColor = UIColor().hexToColor(hex: "#1FB1F0").cgColor
           self.layer.borderWidth = 3
           self.layer.cornerRadius = 25
           self.layer.shadowOpacity = 5
}
    
}
extension UIImageView {
    
    func Imglayout(){
        self.backgroundColor = UIColor.lightGray
        self.layer.cornerRadius = 25

}
}
