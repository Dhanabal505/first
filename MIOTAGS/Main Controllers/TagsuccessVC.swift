//
//  TagsuccessVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 10/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class TagsuccessVC: UIViewController {
    
    
    lazy var Header:CustomHeader={
        let view = CustomHeader(title: "")
        view?.translatesAutoresizingMaskIntoConstraints = false
        return view!
    }()
    
    lazy var successview:CustomView={
        let view = CustomView()
        return view
    }()
    
    lazy var success:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "success")
        return img
    }()
    
    lazy var mylbl:UILabel={
        let lbl = UILabel()
        return lbl
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
    
    func translate(){
        
        successview.translatesAutoresizingMaskIntoConstraints=false
        success.translatesAutoresizingMaskIntoConstraints=false
        mylbl.translatesAutoresizingMaskIntoConstraints=false
        
    }
    
    func Setsubviews(){
        
        view.addSubview(Header)
        view.addSubview(successview)
        view.addSubview(success)
        view.addSubview(mylbl)
    }
    
    
    func layout(){
        
        
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        successview.anchorWith_XY_Padd(x: view.centerXAnchor, y: view.centerYAnchor,padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        successview.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.6, constHeight: 0.3)
        successview.addSubview(success)
        successview.addSubview(mylbl)
        
        
        
        success.contentMode = .scaleToFill
        success.anchorWith_XY_Padd(x: successview.centerXAnchor, y: successview.centerYAnchor)
        success.anchorWith_WidthHeight(width: successview.widthAnchor, height: successview.heightAnchor, constWidth: 0.5, constHeight: 0.5)
        
        mylbl.anchorWith_TopLeftBottomRight_Padd(top: success.bottomAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        mylbl.anchorWith_XY_Padd(x: success.centerXAnchor, y: nil)
        mylbl.lblssr(str: "Successfully Read")
        
    }
    

}
