//
//  CustomView.swift
//  MIOTAGS
//
//  Created by Dhanabal on 02/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Viewsetup()
  
}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Viewsetup()
}
    
    func Viewsetup(){
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor().hexToColor(hex: "#1FB1F0").cgColor
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 25
        self.layer.shadowOpacity = 5
    }
}
