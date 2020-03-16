//
//  MenuBTN.swift
//  MIOTAGS
//
//  Created by Dhanabal on 26/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit


class Menubtn:UIButton{

    override init(frame: CGRect) {
        super.init(frame: frame)

        sidemenubtn()

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")

    }

    func sidemenubtn(){
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints=false
        view.tintColor = UIColor.white

        self.addSubview(view)
        view.anchorWith_TopLeftBottomRight_Padd(top: self.bottomAnchor, left: self.leadingAnchor, bottom: nil, right: self.trailingAnchor,padd: .init(top: 5, left: 0, bottom: 0, right: -20))
        view.anchorWith_Height(height: nil, const: 1)
    }
}

class CustomBTN : UIButton{
    
    required init(title: String) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setBackgroundImage(UIImage(named: "btnbgrnd"), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        
    }
    
   
    
        
        
    
}

