//
//  File.swift
//  MIOTAGS
//
//  Created by Dhanabal on 03/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

import JVFloatLabeledTextField



class TFUnderline:UITextField{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        

        
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints=false
        
        
        self.addSubview(view)
        view.anchorWith_TopLeftBottomRight_Padd(top: nil, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor,padd: .init(top: 0, left: 0, bottom: -1, right: 0))
        view.anchorWith_Height(height: nil, const: 1)
        
    }
    
   
}

class UnderlineTf:JVFloatLabeledTextField{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        mytext()
    }
     override init(frame: CGRect) {
        super.init(frame: frame)
        mytext()
    }
    
    func mytext(){
        
        
        self.font = UIFont.systemFont(ofSize: 17 , weight: .regular)
        self.placeholderColor = UIColor.black
        self.floatingLabelActiveTextColor = UIColor.blue
        self.floatingLabelTextColor = UIColor.blue
        self.anchorWith_Height(height: nil, const: SIZE.TXT_Height)
        
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints=false
        
        
        self.addSubview(view)
        view.anchorWith_TopLeftBottomRight_Padd(top: nil, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor,padd: .init(top: 0, left: 0, bottom: -1, right: 0))
        view.anchorWith_Height(height: nil, const: 1)
        
    }
    
    
}



class showhide:JVFloatLabeledTextField {
    let rightButton  = UIButton(type: .custom)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        
        
        
        self.font = UIFont.systemFont(ofSize: 17 , weight: .regular)
        self.placeholderColor = UIColor.black
        self.floatingLabelActiveTextColor = UIColor.blue
        self.floatingLabelTextColor = UIColor.blue
        self.anchorWith_Height(height: nil, const: SIZE.TXT_Height)
        
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints=false
        
        
        self.addSubview(view)
        self.addSubview(rightButton)
        
        
        view.anchorWith_TopLeftBottomRight_Padd(top: nil, left: leadingAnchor, bottom: self.bottomAnchor, right: trailingAnchor,padd: .init(top: 0, left: 0, bottom: -2, right: 0))
        view.anchorWith_Height(height: nil, const: 1)
        
        rightButton.setImage(UIImage(named: "hide") , for: .normal)
        rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
      
        
        rightButton.translatesAutoresizingMaskIntoConstraints=false
        
        
       self.isSecureTextEntry = true
       self.rightViewMode = .always
        self.rightView = rightButton
        
     
        rightButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive=true
        rightButton.anchorWith_WidthHeight(width: self.widthAnchor, height: self.heightAnchor, constWidth: 0.1, constHeight: 0.7)
        
    }
    
    @objc
    func toggleShowHide(button: UIButton) {
        toggle()
    }
    
    func toggle() {
        self.isSecureTextEntry = !self.isSecureTextEntry
        if self.isSecureTextEntry {
            rightButton.setImage(UIImage(named: "hide") , for: .normal)
        } else {
            rightButton.setImage(UIImage(named: "visible") , for: .normal)
        }
    }
    
}



class HistoryTF : JVFloatLabeledTextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        mytext()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        mytext()
    }
    
    func mytext(){
        
        
        self.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        self.placeholderColor = UIColor.black
        self.floatingLabelActiveTextColor = UIColor.red
        self.floatingLabelTextColor = UIColor.black
       // self.anchorWith_Height(height: nil, const: SIZE.HISTXT_HEIGHT)
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor().hexToColor(hex: "#4fc3f7").cgColor
        self.borderStyle = .roundedRect
        self.backgroundColor = .clear
       
    
      
        
        
       
        
    }
    
    
}





