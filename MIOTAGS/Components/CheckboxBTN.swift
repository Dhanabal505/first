//
//  CheckboxBTN.swift
//  MIOTAGS
//
//  Created by Dhanabal on 26/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

class checkbox: UIButton {
    
    let checkedImage = UIImage(named: "check")! as UIImage
    let uncheckedImage = UIImage(named: "unchk")! as UIImage
    
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        
        setupcontent()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupcontent()
    }
    
    
    func setupcontent(){
                self.isChecked = false
                self.setTitleColor(UIColor.black, for: .normal)
                self.contentHorizontalAlignment = .left
                self.imageView?.contentMode = .scaleAspectFit
                self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
                self.tintColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}


