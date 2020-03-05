//
//  ESupportDoneVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 26/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class ESupportDoneVC: UIViewController {
    
    
    lazy var msgimg:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "support")
        return img
    }()
    
    lazy var msgsendimg:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "msgsuccess")
        return img
    }()
    
    lazy var sucess:UITextView={
        let view = UITextView()
        return view
    }()
    
    lazy var mytitle:UILabel={
        let lbl = UILabel()
        lbl.text = "Support"
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return lbl
    }()
    
    lazy var back:UIButton={
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "left"), for: .normal)
        btn.addTarget(self, action: #selector(backact), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var Header:CustomHeader={
        let side = CustomHeader(title: "")
        return side!
    }()
    
    
    lazy var msgsuccess:UIView={
        let view = UIView()
        return view
    }()
    
    
    lazy var lineview:UIView={
        let view = UIView()
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetSubviews()
        translate()
        layout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
    }
    
    func SetSubviews(){
        
        view.addSubview(msgsuccess)
        view.addSubview(lineview)
        view.addSubview(Header)
        view.addSubview(mytitle)
        view.addSubview(back)
        view.addSubview(msgimg)
        view.addSubview(msgsendimg)
        view.addSubview(sucess)
    }
    
    
    
    func translate(){
        msgimg.translatesAutoresizingMaskIntoConstraints=false
        msgsendimg.translatesAutoresizingMaskIntoConstraints=false
        sucess.translatesAutoresizingMaskIntoConstraints=false
        msgsuccess.translatesAutoresizingMaskIntoConstraints=false
        lineview.translatesAutoresizingMaskIntoConstraints=false
        Header.translatesAutoresizingMaskIntoConstraints=false
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
        
    }
    
    
    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    func layout(){
        
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        mytitle.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 50, left: 0, bottom: 0, right: 0))
        mytitle.anchorWith_XY_Padd(x: msgimg.centerXAnchor, y: nil)
        
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        back.imageView?.contentMode = .scaleAspectFit
        
        msgimg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        msgimg.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: msgsuccess.topAnchor, right: nil, padd: .init(top: 0, left: 0, bottom: -25, right: 0))
        msgimg.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.2, constHeight: 0.1)
        
        
        msgsuccess.anchorWith_XY_Padd(x: view.centerXAnchor, y: view.centerYAnchor,padd: .init(top: 50, left: 0, bottom: 0, right: 0))
        msgsuccess.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.8, constHeight: 0.4)
        msgsuccess.viewlayout()
        msgsuccess.addSubview(msgsendimg)
        msgsuccess.addSubview(lineview)
        msgsuccess.addSubview(sucess)
        
        msgsendimg.anchorWith_XY_Padd(x: msgsuccess.centerXAnchor, y: msgsuccess.centerYAnchor,padd: .init(top: -50, left: 0, bottom: 0, right: 0))
        msgsendimg.anchorWith_WidthHeight(width: msgsuccess.widthAnchor, height: msgsuccess.heightAnchor, constWidth: 0.7, constHeight: 0.7)
        
        
        lineview.anchorWith_TopLeftBottomRight_Padd(top: msgsendimg.bottomAnchor, left: msgsuccess.leadingAnchor, bottom: nil, right: msgsuccess.trailingAnchor,padd: .init(top: 5, left: 5, bottom: 0, right: -5))
        lineview.anchorWith_Height(height: nil, const: 1)
        lineview.backgroundColor = UIColor.black
        
        sucess.anchorWith_TopLeftBottomRight_Padd(top: lineview.bottomAnchor, left: msgsuccess.leadingAnchor, bottom: nil, right: msgsuccess.trailingAnchor,padd: .init(top: 10, left: 7.5, bottom: 0, right: 0))
        sucess.text = "Thanks for your message,we will contact you back within 24 Hours."
        sucess.anchorWith_WidthHeight(width: msgsuccess.widthAnchor, height: msgsuccess.heightAnchor, constWidth: 0.95, constHeight: 0.23)
        sucess.isEditable = false
        sucess.isScrollEnabled = false
        sucess.textAlignment = .left
        sucess.font = UIFont.systemFont(ofSize: 14)
    }
}
