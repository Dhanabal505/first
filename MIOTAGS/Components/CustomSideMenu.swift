//
//  CustomMenu.swift
//  MIOTAGS
//
//  Created by Dhanabal on 26/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit


class CustomSideMenu : UIView{
    
    
    
    
    let sidebtn = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgrnd()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        bgrnd()
        
    }
    
    func bgrnd(){
        self.addSubview(sidebtn)
        
        
        sidebtn.addTarget(self, action: #selector(btnact), for: .touchUpInside)
        
        
        sidebtn.translatesAutoresizingMaskIntoConstraints=false
        
        
        sidebtn.setImage(UIImage(named: "sidebar"), for: .normal)
        sidebtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive=true
        sidebtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive=true
        sidebtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive=true
        sidebtn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive=true
        
        
        
        
    }
    let sidemenu = SideMenuLauncher()
    
    @objc func btnact(){
        
        sidemenu.showSideMenu()
        
    }
    
    
    
}
