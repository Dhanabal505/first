//
//  CustomLBL.swift
//  MIOTAGS
//
//  Created by Dhanabal on 03/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

class CustomLBL: UILabel {
    
    required init(title: String) {
        super.init(frame: .zero)
        
        self.text = title
        self.textColor = .white
        self.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
