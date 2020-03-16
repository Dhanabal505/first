//
//  ForgotpassVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 16/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class ForgotpassVC: UIViewController {
    
    lazy var HeaderLogo:CustomHeader={
        let logo = CustomHeader(title: "")
        logo?.translatesAutoresizingMaskIntoConstraints = false
        return logo!
    }()
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "Forgot Password")
        return lbl
    }()
    
    
    lazy var back:UIButton={
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(named: "left"), for: .normal)
        btn.addTarget(self, action: #selector(backact), for: .touchUpInside)
        return btn
    }()
    
    lazy var email:UnderlineTf={
        let tf = UnderlineTf()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.floatingLabelTextColor = .red
        tf.floatingLabelActiveTextColor = .red
        tf.placeholder = "Email"
        return tf
    }()
    
    lazy var send:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(named: "send"), for: .normal)
       // btn.addTarget(self, action: #selector(sendact), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        SetSubViews()
        layout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
    }
    
    func SetSubViews(){
        view.addSubview(HeaderLogo)
        view.addSubview(mytitle)
        view.addSubview(back)
        view.addSubview(email)
        view.addSubview(send)
    }
    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func layout(){
        
        
        HeaderLogo.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        HeaderLogo.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        mytitle.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: HeaderLogo.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 40, left: 0, bottom: 0, right: 0))
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        back.imageView?.contentMode = .scaleAspectFit
        
        email.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: mytitle.bottomAnchor, left: nil, bottom: nil, right: nil , padd: .init(top: 50, left: 0, bottom: 0, right: 0))
        email.anchorWith_Width(width: view.widthAnchor, const: 0.6)
        

        send.anchorWith_XY_TopLeftBottomRight_Padd(x: email.centerXAnchor, y: nil
            , top: email.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
         send.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 0.4, constHeight: SIZE.Send_Height)
    }
   
}
