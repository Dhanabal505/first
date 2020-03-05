//
//  Tagfailure.swift
//  MIOTAGS
//
//  Created by Dhanabal on 10/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class Tagfailure: UIViewController {
    
    
    lazy var Header:CustomMenuHeader={
        let view = CustomMenuHeader(title: "")
        return view!
    }()
    
    lazy var failureview:CustomView={
        let view = CustomView()
        return view
    }()
    
    lazy var failure:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "failure")
        img.contentMode = .scaleToFill
        return img
    }()
   
    lazy var stmnt1:UILabel={
        let lbl = UILabel()
        lbl.lbls(names: "Property ID/UID not found,")
        return lbl
    }()
    
    lazy var stmnt2:UILabel={
        let lbl = UILabel()
        lbl.lbls(names: "please contacts support")
        return lbl
    }()
   
    lazy var support:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "supports"), for: .normal)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Setsubviews()
        translate()
        layout()
        
        support.addTarget(self, action: #selector(supportact), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
    }
    
    func translate(){
        
        failureview.translatesAutoresizingMaskIntoConstraints=false
        failure.translatesAutoresizingMaskIntoConstraints=false
        stmnt1.translatesAutoresizingMaskIntoConstraints=false
        stmnt2.translatesAutoresizingMaskIntoConstraints=false
        support.translatesAutoresizingMaskIntoConstraints=false
        Header.translatesAutoresizingMaskIntoConstraints=false
        
    }
    
    
    func Setsubviews(){
        
        view.addSubview(failureview)
        view.addSubview(support)
        view.addSubview(Header)
    }
    
    @objc func supportact(){
        let sprtvc = storyboard?.instantiateViewController(withIdentifier: "SupportVC") as! SupportVC
        navigationController?.pushViewController(sprtvc, animated: true)
    }

    func layout(){
        
        
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        failureview.anchorWith_XY_Padd(x: view.centerXAnchor, y: view.centerYAnchor,padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        failureview.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.6, constHeight: 0.3)
        failureview.addSubview(failure)
        failureview.addSubview(stmnt1)
        failureview.addSubview(stmnt2)
        
        
        failure.anchorWith_XY_Padd(x: failureview.centerXAnchor, y: failureview.centerYAnchor, padd: .init(top: -30, left: 0, bottom: 0, right: 0))
        failure.anchorWith_WidthHeight(width: failureview.widthAnchor, height: failureview.heightAnchor, constWidth: 0.4, constHeight: 0.4)
        
        
        stmnt1.anchorWith_TopLeftBottomRight_Padd(top: failure.bottomAnchor, left: nil, bottom: nil
            , right: nil,padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        stmnt1.anchorWith_XY_Padd(x: failure.centerXAnchor, y: nil)
        
        
        
        stmnt2.anchorWith_TopLeftBottomRight_Padd(top: stmnt1.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        stmnt2.anchorWith_XY_Padd(x: stmnt1.centerXAnchor, y: nil)
        
    
        support.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: view.bottomAnchor, right: nil,padd: .init(top: 0, left: 0, bottom: -100, right: 0))
        support.anchorWith_XY_Padd(x: view.centerXAnchor, y: nil)
        support.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.6
            , constHeight: 0.1)
        
    }

}
