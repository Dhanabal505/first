//
//  TermsVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 25/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class TermsVC: UIViewController {

    lazy var HeaderLogo:CustomHeader={
        let logo = CustomHeader(title: "")
        logo?.translatesAutoresizingMaskIntoConstraints = false
        return logo!
    }()
   
    lazy var switchOnOff:UISwitch={
        let swtch = UISwitch()
        swtch.translatesAutoresizingMaskIntoConstraints=false
        return swtch
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(switchOnOff)
        view.addSubview(HeaderLogo)
        layout()
        
        switchOnOff.addTarget(self, action: #selector(self.switchStateDidChange), for: .valueChanged)
        switchOnOff.setOn(false, animated: true)
        

    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
    }
    
    @objc func switchStateDidChange(sender:UISwitch){
        if (sender.isOn == true){
            sender.setOn(true, animated: true)
            let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            navigationController?.pushViewController(vc, animated: true)
         
        }
        else{
            
            sender.setOn(false, animated: true)
           
            
            
        }
    }

    func layout(){
        HeaderLogo.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        HeaderLogo.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        switchOnOff.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: nil, left: nil, bottom: view.bottomAnchor, right: nil, padd: .init(top: 0, left: 0, bottom: -100, right: 0))
    }
}
