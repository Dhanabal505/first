//
//  Viewextension.swift
//  MIOTAGS
//
//  Created by Dhanabal on 04/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit


// View Border

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

extension UIButton{
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 1.0)
        //        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
