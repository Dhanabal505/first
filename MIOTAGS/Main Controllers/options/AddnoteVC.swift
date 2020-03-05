//
//  AddnoteVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 19/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class AddnoteVC: UIViewController {
    
    let myview = UIView()
    
    lazy var addnote:UILabel={
        let lbl = UILabel()
        lbl.text = "Add note"
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return lbl
    }()
    
    lazy var cancel:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "cancel"), for: .normal)
        return btn
    }()
    
    
    lazy var notetext:UITextView={
        let txt = UITextView()
        txt.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return txt
    }()
    
    lazy var addbtn:UIButton={
        let btn = UIButton()
        btn.ownbtn(text: "Add Note")
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.addSubview(myview)
        view.addSubview(addnote)
        view.addSubview(notetext)
        view.addSubview(cancel)
        view.addSubview(addbtn)
        translate()
        layout()
        
        cancel.addTarget(self, action: #selector(cancelact), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        cancel.addTarget(self, action: #selector(cancelact), for: .touchUpInside)
    }
    
    @objc func cancelact(){
        self.view.removeFromSuperview()
    }

    func translate(){
        myview.translatesAutoresizingMaskIntoConstraints=false
        addnote.translatesAutoresizingMaskIntoConstraints=false
        notetext.translatesAutoresizingMaskIntoConstraints=false
        cancel.translatesAutoresizingMaskIntoConstraints=false
        addbtn.translatesAutoresizingMaskIntoConstraints=false
    }
   
    func layout(){
        myview.anchorWith_XY_Padd(x: view.centerXAnchor, y: view.centerYAnchor)
        myview.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 1, constHeight: 0.3)
        myview.backgroundColor = UIColor.lightGray
        myview.layer.borderColor = UIColor.black.cgColor
        myview.layer.borderWidth = 2
        
        myview.addSubview(addnote)
        myview.addSubview(cancel)
        myview.addSubview(notetext)
        
       
        
        
        addnote.anchorWith_TopLeftBottomRight_Padd(top: myview.topAnchor, left: myview.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 15, left: 20, bottom: 0, right: 0))
        
        cancel.anchorWith_XY_Padd(x: nil, y: addnote.centerYAnchor)
        cancel.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: myview.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        cancel.anchorWith_Height(height: myview.heightAnchor, const: 0.1)
        cancel.imageView?.contentMode = .scaleToFill
        
        
        notetext.anchorWith_TopLeftBottomRight_Padd(top: addnote.bottomAnchor, left: addnote.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        notetext.anchorWith_WidthHeight(width: myview.widthAnchor, height: myview.heightAnchor, constWidth: 0.9, constHeight: 0.5)
        notetext.layer.borderColor = UIColor().hexToColor(hex: "#4fc3f7").cgColor
        notetext.layer.borderWidth = 2
        notetext.layer.cornerRadius = 10
        
        addbtn.anchorWith_TopLeftBottomRight_Padd(top: notetext.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        addbtn.anchorWith_XY_Padd(x: notetext.centerXAnchor, y: nil)
        
    }

}
