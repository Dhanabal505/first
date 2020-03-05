//
//  TFextension.swift
//  MIOTAGS
//
//  Created by Dhanabal on 04/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit
import JVFloatLabeledTextField


// TF extension

extension  UITextField{
    
    func addtf(placeholder: String){
        self.attributedPlaceholder =
            NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 10
        self.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        self.backgroundColor = UIColor.clear
        
    }
}


extension UIButton{
    
    func ownbtn(text: String){
        
        
      
         let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = self.frame.size
        gradientLayer.colors = [UIColor().hexToColor(hex: "#004c8c"),UIColor().hexToColor(hex: "#4fc3f7").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.addSublayer(gradientLayer)
        self.setTitle(text, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        
        
    }
}


extension JVFloatLabeledTextField {
    
    func addInputViewDatePicker(target: Any, selector: Selector) {
        
        let screenWidth = UIScreen.main.bounds.width
        
        //Add DatePicker as inputView
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = .date
        self.inputView = datePicker
        
        //Add Tool Bar as input AccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
        
        self.inputAccessoryView = toolBar
    }
    
    @objc func cancelPressed() {
        self.resignFirstResponder()
    }
}
