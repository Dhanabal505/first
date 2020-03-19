//
//  CustomHeader.swift
//  MIOTAGS
//
//  Created by Dhanabal on 03/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit


// LOGIN PAGE:- HEADER

class CustomHeader:UIView{
    
    lazy var IMGLogo:UIImageView={
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        img.image = UIImage(named: "appicon")
        return img
    }()
    
    
    required init?(title: String) {
        super.init(frame: .zero)
        SetHeader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func SetHeader(){
        
        self.addSubview(IMGLogo)
        
        
        
        IMGLogo.anchorWith_XY_TopLeftBottomRight_Padd(x: centerXAnchor, y: nil, top: topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 5, left: 0, bottom: 0, right: 0))
        IMGLogo.anchorWith_WidthHeight(width: self.widthAnchor, height: nil, constWidth: 0.5, constHeight: SIZE.LOGO_Height)
    }
}




// ALL PAGE :- HEADER


class CustomMenuHeader:UIView{
    
    lazy var IMGLogo:UIImageView={
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        img.image = UIImage(named: "appicon")
        return img
    }()
    
    
    lazy var LeftMenu:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "sidebar"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    
    lazy var RightMenu:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "bar"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    
    required init?(title: String) {
        super.init(frame: .zero)
        SetHeader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func SetHeader(){
        
        self.addSubview(IMGLogo)
        self.addSubview(LeftMenu)
        self.addSubview(RightMenu)
        LeftMenu.addTarget(self, action: #selector(btnact), for: .touchUpInside)
        RightMenu.addTarget(self, action: #selector(optact), for: .touchUpInside)
        
        
        IMGLogo.anchorWith_XY_TopLeftBottomRight_Padd(x: centerXAnchor, y: nil, top: topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 5, left: 0, bottom: 0, right: 0))
        IMGLogo.anchorWith_WidthHeight(width: self.widthAnchor, height: nil, constWidth: 0.5, constHeight: SIZE.LOGO_Height)
        
        
        LeftMenu.anchorWith_TopLeftBottomRight_Padd(top: topAnchor, left: leadingAnchor, bottom: nil, right: nil, padd: .init(top: 8, left: 10, bottom: 0, right: 0))
        LeftMenu.anchorWith_WidthHeight(width: widthAnchor, height: nil, constWidth: 0.1, constHeight: SIZE.LeftMenu_Height)
        
        
        RightMenu.anchorWith_TopLeftBottomRight_Padd(top: topAnchor, left: nil, bottom: nil, right: trailingAnchor, padd: .init(top: 5, left: 0, bottom: 0, right: -10))
        RightMenu.anchorWith_WidthHeight(width: self.widthAnchor, height: nil, constWidth: 0.1, constHeight: SIZE.RightMenu_Height)
    }
    
    
    let sidemenu = SideMenuLauncher()
    
    @objc func btnact(){
        
        sidemenu.showSideMenu()
        
    }
    
    let vc = NavigationModel.vcViewModel
    
    @objc func optact(){
        
        let tapvc = vc.storyboard?.instantiateViewController(withIdentifier: "TapScanVC") as! TapScanVC
        vc.navigationController?.pushViewController(tapvc, animated: true)
        
    }
    
}
