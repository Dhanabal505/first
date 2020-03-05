//
//  SwitchBTNextension.swift
//  MIOTAGS
//
//  Created by Dhanabal on 05/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

class EyeButton: UIButton {
    
    // Images
    let eyeShowImage = UIImage(named: "visible")! as UIImage
    let eyeHideImage = UIImage(named: "hide")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(eyeHideImage.withRenderingMode(.alwaysTemplate), for: .normal)
            } else {
                self.setImage(eyeShowImage.withRenderingMode(.alwaysTemplate), for: .normal)
                
            }
            //            self.tintColor = UIColor().setBorderColor()
            //            self.tintColor = UIColor().hexStringToUIColor(hex: "#332949")
        }
    }
    
    override func awakeFromNib() {
        setupContent()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContent()
        
    }
    
    func setupContent(){
        self.translatesAutoresizingMaskIntoConstraints=false
        self.tintColor = UIColor.black
        //        self.backgroundColor = UIColor.green
        
        self.imageEdgeInsets = UIEdgeInsets(top: 10, left: 19, bottom: 10, right: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}






