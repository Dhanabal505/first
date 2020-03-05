//
//  SupportVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 05/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class SupportVC: UIViewController {
    
    
    lazy var msgimg:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "support")
        return img
    }()
    
    lazy var name:UnderlineTf={
        let tf = UnderlineTf()
        tf.placeholder = "Name"
        return tf
    }()
    
    lazy var email:UnderlineTf={
        let tf = UnderlineTf()
        tf.placeholder = "Email"
        return tf
    }()
   
    lazy var message:UITextView={
        let msg = UITextView()
        return msg
    }()
    
    lazy var send:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "send"), for: .normal)
        btn.addTarget(self, action: #selector(sendact), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var supportview:CustomView={
        let view = CustomView()
        return view
    }()
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "Support")
        return lbl
    }()
    
    lazy var back:UIButton={
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "left"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(backact), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var Header:CustomMenuHeader={
        let view = CustomMenuHeader(title: "")
        return view!
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Setsubviews()
       
        translate()
        layout()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
    }

    func Setsubviews(){
        
        view.addSubview(Header)
        view.addSubview(msgimg)
        view.addSubview(supportview)
        view.addSubview(name)
        view.addSubview(email)
        view.addSubview(message)
        view.addSubview(send)
        view.addSubview(mytitle)
        view.addSubview(back)

    }

    
    
    func translate(){
        
        Header.translatesAutoresizingMaskIntoConstraints=false
        supportview.translatesAutoresizingMaskIntoConstraints=false
        name.translatesAutoresizingMaskIntoConstraints=false
        email.translatesAutoresizingMaskIntoConstraints=false
        message.translatesAutoresizingMaskIntoConstraints=false
        send.translatesAutoresizingMaskIntoConstraints=false
        msgimg.translatesAutoresizingMaskIntoConstraints=false
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
    }
    
    
    @objc func sendact(){
        
    let sendbtn = storyboard?.instantiateViewController(withIdentifier: "SupportdoneVC") as! SupportdoneVC
    navigationController?.pushViewController(sendbtn, animated: true)
        
    }
    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    func layout(){
        
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        mytitle.anchorWith_XY_TopLeftBottomRight_Padd(x: msgimg.centerXAnchor, y: nil, top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 50, left: 0, bottom: -10, right: 0))
        
        
        back.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: mytitle.centerYAnchor, top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        
        
        msgimg.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: nil, left: nil, bottom: supportview.topAnchor, right: nil, padd: .init(top: 0, left: 0, bottom: -25, right: 0))
        msgimg.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.2, constHeight: 0.1)
        
        
        supportview.anchorWith_XY_Padd(x: view.centerXAnchor, y: view.centerYAnchor,padd: .init(top: 50, left: 0, bottom: 0, right: 0))
        supportview.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 0.8, constHeight: SIZE.SVIEW_HEIGHT)
        supportview.addSubview(name)
        supportview.addSubview(email)
        supportview.addSubview(message)
        
        
        name.anchorWith_TopLeftBottomRight_Padd(top: supportview.topAnchor, left: supportview.leadingAnchor, bottom: nil, right: supportview.trailingAnchor,padd: .init(top: 15, left: 10, bottom: 0, right: -10))

        
        email.anchorWith_TopLeftBottomRight_Padd(top: name.bottomAnchor, left: name.leadingAnchor, bottom: nil, right: name.trailingAnchor, padd: .init(top: 15, left: 0, bottom: 0, right: 0))
       
       
        
        message.anchorWith_TopLeftBottomRight_Padd(top: email.bottomAnchor, left: supportview.leadingAnchor, bottom: nil, right: supportview.trailingAnchor, padd: .init(top: 15, left: 10, bottom: 0, right: -10))
        message.anchorWith_Height(height: supportview.heightAnchor, const: 0.5)
        message.layer.cornerRadius = 10
        message.backgroundColor = UIColor().hexToColor(hex: "#8B8269")
        
        
        send.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: supportview.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 40, left: 0, bottom: 0, right: 0))
        send.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.4, constHeight: 0.1)
        
    }
  
}
