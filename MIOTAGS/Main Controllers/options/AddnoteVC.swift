//
//  AddnoteVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 19/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

protocol Addnoteprotocol {
    func setnote(strnote:String, index:String)
}


class AddnoteVC: UIViewController {
    
    var myprotocol:Addnoteprotocol!
    
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
         txt.translatesAutoresizingMaskIntoConstraints=false
        return txt
    }()
    
    lazy var addbtn:CustomBTN={
        let btn = CustomBTN(title: "Add Note")
        return btn
    }()
    
    var EditData = [String:Any]()
    var Index = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        notetext.delegate = self
        view.backgroundColor = UIColor(white: 0, alpha: 0.30)
        view.addSubview(myview)
        view.addSubview(addnote)
        view.addSubview(notetext)
        view.addSubview(cancel)
        view.addSubview(addbtn)
        setTapGesture()
        setNavigation()
        translate()
        layout()
        
        addbtn.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        cancel.addTarget(self, action: #selector(cancelact), for: .touchUpInside)
        
         print("Edit - \(EditData) - \(EditData.count)")
        
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func initialLoad(){
        if EditData.count != 0{
            if let note = EditData["note"] as? String{
                notetext.text = note
            }
        }
    }
    
    @objc func handleSave(){
        view.endEditing(true)
        
        let strNote = notetext.text!
        
        
        if strNote.count == 0{
          print("no data")
            return
        }
       
        myprotocol.setnote(strnote: "\(notetext.text!)", index: Index)
        dismiss(animated: true , completion: nil)
        self.view.removeFromSuperview()
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
    }
    
    @objc func cancelact(){
        self.view.removeFromSuperview()
    }
    
    func setTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissed))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    @objc func handleDismissed(){
        self.view.endEditing(true)
    }

    func translate(){
        myview.translatesAutoresizingMaskIntoConstraints=false
        addnote.translatesAutoresizingMaskIntoConstraints=false
       
        cancel.translatesAutoresizingMaskIntoConstraints=false
        addbtn.translatesAutoresizingMaskIntoConstraints=false
    }
   
    func layout(){
        myview.anchorWith_XY_Padd(x: view.centerXAnchor, y: view.centerYAnchor)
        myview.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 1, constHeight: 300)
        myview.backgroundColor = UIColor.lightGray
        myview.layer.borderColor = UIColor.black.cgColor
        myview.layer.borderWidth = 2
        
        myview.addSubview(addnote)
        myview.addSubview(cancel)
        myview.addSubview(notetext)
        
       
        addnote.anchorWith_TopLeftBottomRight_Padd(top: myview.topAnchor, left: myview.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 15, left: 20, bottom: 0, right: 0))
        
        cancel.anchorWith_XY_Padd(x: nil, y: addnote.centerYAnchor)
        cancel.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: myview.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        cancel.anchorWith_Height(height: nil, const: 30)
        cancel.imageView?.contentMode = .scaleAspectFit
        
        
        notetext.anchorWith_TopLeftBottomRight_Padd(top: addnote.bottomAnchor, left: addnote.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        notetext.anchorWith_WidthHeight(width: myview.widthAnchor, height: nil, constWidth: 0.9, constHeight: SIZE.TEXTVW_HEIGHT)
        notetext.layer.borderColor = UIColor().hexToColor(hex: "#4fc3f7").cgColor
        notetext.layer.borderWidth = 2
        notetext.layer.cornerRadius = 10
        
        addbtn.anchorWith_TopLeftBottomRight_Padd(top: notetext.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        addbtn.anchorWith_XY_Padd(x: notetext.centerXAnchor, y: nil)
        addbtn.anchorWith_WidthHeight(width: myview.widthAnchor, height: nil, constWidth: 0.4, constHeight: SIZE.SEARCH_HEIGHT)
        
    }

}
extension AddnoteVC:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
}
