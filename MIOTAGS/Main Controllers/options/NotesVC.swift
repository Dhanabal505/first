//
//  NotesVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 10/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class NotesVC: UIViewController {

    var Mynotes:NSArray = Noteslist.NOTES
    
    lazy var Header:CustomMenuHeader={
        let side = CustomMenuHeader(title: "")
        return side!
    }()
    
    lazy var noteslogo:UIImageView={
        let img = UIImageView()
        return img
    }()
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "NOTES")
        return lbl
    }()
    
    
    lazy var back:UIButton={
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "left"), for: .normal)
        return btn
    }()
    
    lazy var addnote:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(named: "notes"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(addnotesact), for: .touchUpInside)
        return btn
    }()
    
    lazy var noteplus:UILabel={
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints=false
        lbl.text = "Add Note"
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return lbl
    }()
    
    lazy var Myscroll:UIScrollView={
        let scrl = UIScrollView()
        return scrl
    }()
    
    let myview = UIView()
    
    lazy var addnotelbl:UILabel={
        let lbl = UILabel()
        lbl.text = "Add note"
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    lazy var cancel:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "cancel"), for: .normal)
        btn.addTarget(self, action: #selector(cancelact), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints=false
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
        btn.addTarget(self, action: #selector(APICallingfunc), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myview.isHidden = true
        
        view.addSubview(Header)
        view.addSubview(noteslogo)
        view.addSubview(mytitle)
        view.addSubview(back)
        view.addSubview(addnote)
        view.addSubview(noteplus)
        view.addSubview(Myscroll)
        view.addSubview(myview)
        
        translate()
        layout()
        notes()
       setTapGesture()
        
        back.addTarget(self, action: #selector(backact), for: .touchUpInside)
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
    }
    
    @objc func backact(){
       let vc = storyboard?.instantiateViewController(withIdentifier: "OptionVC") as! OptionVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func addnotesact(){

        myview.isHidden = false
    }
    
    @objc func cancelact(){
        
        myview.isHidden = true
    }
    
    func setTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissed))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    @objc func handleDismissed(){
        self.view.endEditing(true)
    }
    
    func notes(){
        
        var Y:CGFloat = 20
        
//        for subview in Myscroll.subviews{
//
//            subview.removeFromSuperview()
//        }
        
        for datas in Mynotes{
            
            let dict = datas as? NSDictionary
            if let getnotes = dict!["note"] as? String {
            
          var mytxtvw : CustomTXTVW={
            let txtvw = CustomTXTVW()
            return txtvw
        }()
        
        mytxtvw.translatesAutoresizingMaskIntoConstraints=false
        
        Myscroll.addSubview(mytxtvw)
                
                mytxtvw.text = getnotes
                
                mytxtvw.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: Myscroll.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: Y, left: 0, bottom: 0, right: 0))
                mytxtvw.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 0.9, constHeight: SIZE.TEXTVW_HEIGHT)
                
                Y += 150
                
                Myscroll.contentSize.height = Y
            }
        }
    }
    
    @objc func APICallingfunc(){
        
        validsupport()
        
        validasset()
    }
    
    func validasset(){
        let StrAsset = "1234"
        let StrUserid = User.userId!
        let getdata = ["assetId":StrAsset,"userId":StrUserid] as! [String:String]
        AssetAPI(data: getdata)
    }
    
    func AssetAPI(data:[String:String]){
        
        
        let loader = LoaderView()
        loader.showLoader()
        
        
        
        APIs.asset(data: data) { (record,error) in
            loader.hideLoader()
            
            
            if error != nil{
                switch error {
                case .connectionError?:
                    print("Connection Error")
                    self.makeToast(strMessage: "No Internet Connection")
                    break
                case .noDataAvailable?:
                    print("No Data Available")
                    self.makeToast(strMessage: "Invalid Asset ID")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Tagfailure") as! Tagfailure
                    self.navigationController?.pushViewController(vc, animated: true)
                    break
                case .serverError?:
                    print("Server Error")
                    self.makeToast(strMessage: "Server Error")
                    break
                case .invalidData?:
                    print("Invalid Data")
                    self.makeToast(strMessage: "Inavlid Asset ID")
                    break
                default:
                    print("No Data")
                }
                return
            }
            
        }
    }
    
    
    func validsupport(){
        
        let AssetID = 1234
        let Notes = notetext.text!
        
        let getdata = ["assetId":AssetID,"note":Notes] as! [String:Any]
        InitialAPI(data: getdata)
    }
    
    
    func InitialAPI(data:[String:Any]){
        
        let loader = LoaderView()
        loader.showLoader()
        
        APIs.postAPI(path: STRING.ADDNOTE, data: data){ (record,error) in
            loader.hideLoader()
            
            
            
            if error != nil{
                switch error {
                case .connectionError?:
                    print("Connection Error")
                    self.makeToast(strMessage: "No Internet Connection")
                    break
                case .noDataAvailable?:
                    print("No Data Available")
                    self.makeToast(strMessage: "No Data Available")
                    break
                case .serverError?:
                    print("Server Error")
                    self.makeToast(strMessage: "Server Error")
                    break
                case .invalidData?:
                    print("Invalid Data")
                    self.makeToast(strMessage: "Server Error")
                    break
                default:
                    print("No Data")
                }
                return
            }
            
            self.makeToast(strMessage: "Note Added Successfully")
            
            self.myview.isHidden = true
            
           
            
        }
        
    }


    func translate(){
        Header.translatesAutoresizingMaskIntoConstraints=false
        noteslogo.translatesAutoresizingMaskIntoConstraints=false
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
        Myscroll.translatesAutoresizingMaskIntoConstraints=false
        myview.translatesAutoresizingMaskIntoConstraints=false
    }
    
    func layout(){
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        mytitle.anchorWith_XY_Padd(x: noteslogo.centerXAnchor, y: nil)
        mytitle.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: noteslogo.topAnchor, right: nil, padd: .init(top: 0, left: 0, bottom: -20, right: 0))
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        back.imageView?.contentMode = .scaleAspectFit
        
        
        noteslogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        noteslogo.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 120, left: 0, bottom: 0, right: 0))
        noteslogo.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.2, constHeight: 0.1)
        noteslogo.image = UIImage(named: "noteslogo")
        
        addnote.anchorWith_XY_TopLeftBottomRight_Padd(x: noteslogo.centerXAnchor, y: view.centerYAnchor, top: nil, left: nil, bottom: nil, right: nil, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
         addnote.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 0.3, constHeight: 80)
        
        noteplus.anchorWith_XY_Padd(x: addnote.centerXAnchor, y: nil)
        noteplus.anchorWith_TopLeftBottomRight_Padd(top: addnote.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        Myscroll.anchorWith_TopLeftBottomRight_Padd(top: noteplus.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        Myscroll.contentSize.height = 1200
        
        myview.anchorWith_XY_Padd(x: view.centerXAnchor, y: view.centerYAnchor)
        myview.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 1, constHeight: 300)
        myview.backgroundColor = UIColor.lightGray
        myview.layer.borderColor = UIColor.black.cgColor
        myview.layer.borderWidth = 2
        myview.addSubview(addnotelbl)
        myview.addSubview(cancel)
        myview.addSubview(notetext)
        myview.addSubview(addbtn)
        
        
        addnotelbl.anchorWith_TopLeftBottomRight_Padd(top: myview.topAnchor, left: myview.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 15, left: 20, bottom: 0, right: 0))
        
        cancel.anchorWith_XY_Padd(x: nil, y: addnotelbl.centerYAnchor)
        cancel.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: myview.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        cancel.anchorWith_Height(height: nil, const: 30)
        cancel.imageView?.contentMode = .scaleAspectFit
        
        
        notetext.anchorWith_TopLeftBottomRight_Padd(top: addnotelbl.bottomAnchor, left: addnotelbl.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        notetext.anchorWith_WidthHeight(width: myview.widthAnchor, height: nil, constWidth: 0.9, constHeight: SIZE.TEXTVW_HEIGHT)
        notetext.layer.borderColor = UIColor().hexToColor(hex: "#4fc3f7").cgColor
        notetext.layer.borderWidth = 2
        notetext.layer.cornerRadius = 10
        
        addbtn.anchorWith_TopLeftBottomRight_Padd(top: notetext.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        addbtn.anchorWith_XY_Padd(x: notetext.centerXAnchor, y: nil)
        addbtn.anchorWith_WidthHeight(width: myview.widthAnchor, height: nil, constWidth: 0.4, constHeight: SIZE.SEARCH_HEIGHT)
        
        
    }
   
}

