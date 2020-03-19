//
//  MyprofileVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 05/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class MyprofileVC: UIViewController {
    
    
    lazy var Header:CustomMenuHeader={
        let view = CustomMenuHeader(title: "")
        view?.translatesAutoresizingMaskIntoConstraints=false
        return view!
    }()
    
    
    lazy var Myscroll:UIScrollView={
        let scrl = UIScrollView()
        scrl.translatesAutoresizingMaskIntoConstraints=false
        return scrl
    }()
    
    lazy var username:UnderlineTf={
        let tf = UnderlineTf()
        tf.translatesAutoresizingMaskIntoConstraints=false
        tf.placeholder = "Username"
        tf.isEnabled = false
        return tf
    }()
    
    lazy var name:UnderlineTf={
        let tf = UnderlineTf()
        tf.translatesAutoresizingMaskIntoConstraints=false
        tf.placeholder = "Name"
        tf.isEnabled = false
        return tf
    }()
    
    lazy var company:UnderlineTf={
        let tf = UnderlineTf()
        tf.translatesAutoresizingMaskIntoConstraints=false
        tf.placeholder = "Company"
        tf.isEnabled = false
        return tf
    }()
    
    lazy var phone:UnderlineTf={
        let tf = UnderlineTf()
        tf.translatesAutoresizingMaskIntoConstraints=false
        tf.placeholder = "Phone"
        tf.isEnabled = false
        return tf
    }()
    
    lazy var Email:UnderlineTf={
        let tf = UnderlineTf()
        tf.translatesAutoresizingMaskIntoConstraints=false
        tf.placeholder = "Email"
        tf.isEnabled = false
        return tf
    }()
    
    
    lazy var pfimg:UIImageView={
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        img.image = UIImage(named: "profile")
        return img
    }()
 
    
    lazy var profileview:CustomView={
       let view = CustomView()
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "MY PROFILE")
        return lbl
    }()
    
    
    lazy var back:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(named: "left"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(backact), for: .touchUpInside)
        return btn
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Setsubviews()
        setTapGesture()
        layout()
       
        username.text = User.userName
        name.text = User.CustomerName
        phone.text = User.MobileNo
        company.text = User.CompanyName
        
   }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
       
    }
    
   
    
    func Setsubviews(){
        
        
        view.addSubview(Header)
        view.addSubview(Myscroll)
        Myscroll.addSubview(profileview)
        Myscroll.addSubview(mytitle)
        Myscroll.addSubview(back)
        Myscroll.addSubview(username)
        Myscroll.addSubview(name)
        Myscroll.addSubview(company)
        Myscroll.addSubview(phone)
        Myscroll.addSubview(Email)
        Myscroll.addSubview(pfimg)
       
    }
    
    
    func setTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissed))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    @objc func handleDismissed(){
        self.view.endEditing(true)
    }
    
  
    
    @objc func backact(){
    
    self.navigationController?.popViewController(animated: true)
    
    }
    

    
    func layout(){
        
        
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        Myscroll.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: nil, top: Header.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Myscroll.contentSize.height = 600
        
        
        mytitle.anchorWith_TopLeftBottomRight_Padd(top: Myscroll.topAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        mytitle.anchorWith_XY_Padd(x: Myscroll.centerXAnchor, y: nil)
        
        
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        
       
        pfimg.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: mytitle.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        pfimg.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.2, constHeight: 0.1)
       
        
        
        profileview.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: pfimg.bottomAnchor, left: nil, bottom: nil, right: nil , padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        profileview.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 0.8, constHeight: SIZE.PVIEW_HEIGHT)
        profileview.addSubview(username)
        profileview.addSubview(name)
        profileview.addSubview(company)
        profileview.addSubview(phone)
        profileview.addSubview(Email)
        
        
        company.anchorWith_XY_TopLeftBottomRight_Padd(x: profileview.centerXAnchor, y: profileview.centerYAnchor, top: nil, left: profileview.leadingAnchor, bottom: nil, right: profileview.trailingAnchor, padd: .init(top: 0, left: 10, bottom: 0, right: -10))
    
        
        name.anchorWith_TopLeftBottomRight_Padd(top: nil, left: company.leadingAnchor, bottom: company.topAnchor, right: company.trailingAnchor, padd: .init(top: 0, left: 0, bottom: -15, right: 0))
       
        
        username.anchorWith_TopLeftBottomRight_Padd(top: nil, left: company.leadingAnchor, bottom: name.topAnchor, right: company.trailingAnchor, padd: .init(top: 0, left: 0, bottom: -15, right: 0))
        
    
        phone.anchorWith_TopLeftBottomRight_Padd(top: company.bottomAnchor, left: company.leadingAnchor, bottom: nil, right: company.trailingAnchor, padd: .init(top: 15, left: 0, bottom: 0, right: 0))

        
        Email.anchorWith_TopLeftBottomRight_Padd(top: phone.bottomAnchor, left: company.leadingAnchor, bottom: nil, right: company.trailingAnchor, padd: .init(top: 15, left: 0, bottom: 0, right: 0))
       
        
    }
}
