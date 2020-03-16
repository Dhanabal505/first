//
//  statusbar.swift
//  MIOTAGS
//
//  Created by Dhanabal on 03/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

extension UIViewController{
   
    func stsbar(){
        
        
        
            let icon = UIImageView()
            let imageViewBackground = UIImageView()
        
        
            self.view.addSubview(icon)
            view.addSubview(imageViewBackground)
            view.sendSubviewToBack(imageViewBackground)
        
        
            icon.translatesAutoresizingMaskIntoConstraints=false
            imageViewBackground.translatesAutoresizingMaskIntoConstraints=false
        
        
        icon.image = UIImage(named: "appicon")
        icon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive=true
        icon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        icon.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive=true
        icon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive=true
        
        
        
        imageViewBackground.image = UIImage(named: "mioback")
        imageViewBackground.contentMode = .scaleToFill
        imageViewBackground.anchorWith_TopLeftBottomRight_Padd(top: icon.bottomAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 5, left: 0, bottom: 0, right: 0))
        imageViewBackground.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 1, constHeight: 1)
    
    }
    
    
    
 // Header 
    
    func option(){




            let icon = UIImageView()
            let imageViewBackground = UIImageView()
            let optbtn = UIButton()


          optbtn.addTarget(self, action: #selector(optact), for: .touchUpInside)

            self.view.addSubview(icon)
            view.addSubview(imageViewBackground)
            view.sendSubviewToBack(imageViewBackground)
            view.addSubview(optbtn)


            icon.translatesAutoresizingMaskIntoConstraints=false
            imageViewBackground.translatesAutoresizingMaskIntoConstraints=false
            optbtn.translatesAutoresizingMaskIntoConstraints=false

        
            icon.image = UIImage(named: "appicon")
            icon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 5).isActive=true
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
            icon.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive=true
            icon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive=true


            imageViewBackground.image = UIImage(named: "mioback")
            imageViewBackground.contentMode = .scaleToFill
            imageViewBackground.anchorWith_TopLeftBottomRight_Padd(top: icon.bottomAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 5, left: 0, bottom: 0, right: 0))
            imageViewBackground.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 1, constHeight: 1)


        optbtn.setImage(UIImage(named: "bar1"), for: .normal)
        optbtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 5).isActive = true
        optbtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive=true
        optbtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.08).isActive=true
        optbtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive=true

       
     }
    
    
    @objc func optact(){

        let vc = storyboard?.instantiateViewController(withIdentifier: "TapScanVC") as! TapScanVC
        navigationController?.pushViewController(vc, animated: true)
        setNavigation()
    }

    func setNavigation(){

        NavigationModel.vcViewModel = self
        NavigationModel.setNavController(vc: self)
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false;
        self.navigationController?.isNavigationBarHidden = true
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "mioback")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints=false
        
        backgroundImage.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, padd: .init(top: 35, left: 0, bottom: 0, right: 0))
    }
}
    
extension UIViewController{
    
    func makeToast(strMessage:String){
        var style=ToastStyle()
        style.messageAlignment = .center
        self.view.makeToast(strMessage, duration: 3.0, position: .bottom,style:style)
    }
}



