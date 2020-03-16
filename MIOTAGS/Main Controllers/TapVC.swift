//
//  TapVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 10/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class TapVC: UIViewController {
    
    lazy var Header:CustomMenuHeader={
        let view = CustomMenuHeader(title: "")
        return view!
    }()
    
    lazy var taglogo:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "tappage")
        img.contentMode = .scaleAspectFit
        return img
    }()

    lazy var stmnt1:UILabel={
        let lbl = UILabel()
        lbl.text = "Searching NFC..."
        return lbl
    }()
   
    lazy var stmnt2:UILabel={
        let lbl = UILabel()
        lbl.text = "Hold the tag near the phone for easy reading"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "TAP OR SCAN")
        return lbl
    }()
    
    
    lazy var back:UIButton={
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "left"), for: .normal)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Setsubviews()
        translate()
        layout()
        
        back.addTarget(self, action: #selector(backact), for: .touchUpInside)
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
    }
    
    func Setsubviews(){
        
        view.addSubview(mytitle)
        view.addSubview(back)
        view.addSubview(taglogo)
        view.addSubview(stmnt1)
        view.addSubview(stmnt2)
        view.addSubview(Header)
    }
    
    func translate(){
        
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
        taglogo.translatesAutoresizingMaskIntoConstraints=false
        stmnt1.translatesAutoresizingMaskIntoConstraints=false
        stmnt2.translatesAutoresizingMaskIntoConstraints=false
        Header.translatesAutoresizingMaskIntoConstraints=false
        
    }
    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func layout(){
        
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        taglogo.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: nil, left: nil, bottom: view.bottomAnchor, right: nil, padd: .init(top: 0, left: 0, bottom: -130, right: 0))
        taglogo.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.4, constHeight: 0.2)
        
        
        mytitle.anchorWith_XY_Padd(x: view.centerXAnchor, y: nil)
        mytitle.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 80, left: 0, bottom: 0, right: 0))
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        back.imageView?.contentMode = .scaleAspectFit
        
        stmnt1.anchorWith_TopLeftBottomRight_Padd(top: taglogo.bottomAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        stmnt1.anchorWith_XY_Padd(x: taglogo.centerXAnchor, y: nil)
        
        
        stmnt2.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: stmnt1.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 10, left: 0, bottom: 0, right: 0))
       
        
        
    }
}
