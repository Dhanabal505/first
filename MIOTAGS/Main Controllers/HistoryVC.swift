//
//  HistoryVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 07/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {


    lazy var Header:CustomMenuHeader={
        let view = CustomMenuHeader(title: "")
        view?.translatesAutoresizingMaskIntoConstraints=false
        return view!
    }()
    
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "History")
        return lbl
    }()
    
    
    lazy var Historyimg:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "history")
        return img
    }()
    
    lazy var Myscroll:UIScrollView={
        let scrl = UIScrollView()
        return scrl
    }()
    
    lazy var usertf:HistoryTF={
        let tf = HistoryTF()
        tf.placeholder = "User"
        return tf
    }()

    lazy var FrmDate:HistoryTF={
        let tf = HistoryTF()
        tf.placeholder = "From Date"
        tf.addInputViewDatePicker(target: self, selector: #selector(doneButtonPressed))
        return tf
    }()
    
    lazy var EndDate: HistoryTF={
        let tf = HistoryTF()
        tf.placeholder = "End Date"
        tf.addInputViewDatePicker(target: self, selector: #selector(doneButtonpress))
        return tf
    }()
    
    lazy var Asset:HistoryTF={
        let tf =  HistoryTF()
        tf.placeholder = "Asset ID/UID"
        return tf
    }()
    
    lazy var back:UIButton={
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "left"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(backact), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var search:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setTitle("SEARCH", for: .normal)
        btn.backgroundColor = UIColor().hexToColor(hex: "004c8c")
        btn.alpha = 1
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(Myscroll)
        view.addSubview(Header)
        translate()
        layout()
        setTapGesture()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
    }
    
    
    
    func translate(){
      
        Header.translatesAutoresizingMaskIntoConstraints=false
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        Historyimg.translatesAutoresizingMaskIntoConstraints=false
        Myscroll.translatesAutoresizingMaskIntoConstraints=false
        usertf.translatesAutoresizingMaskIntoConstraints=false
        FrmDate.translatesAutoresizingMaskIntoConstraints=false
        EndDate.translatesAutoresizingMaskIntoConstraints=false
        Asset.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
        
    }
    
    
    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonPressed() {
        if let  datePicker = self.FrmDate.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.FrmDate.text = dateFormatter.string(from: datePicker.date)
        }
        
        self.FrmDate.resignFirstResponder()
       
    }
    
    @objc func keyboardWillAppear(){
       
        Myscroll.contentSize.height = view.frame.height + 180
        
        let bottomOffSet = CGPoint(x: 0, y: Myscroll.contentSize.height - Myscroll.bounds.size.height + Myscroll.contentInset.bottom)
        Myscroll.setContentOffset(bottomOffSet, animated: true)
        
    }
    @objc func keyboardWillHide(){
        Myscroll.scrollsToTop = true
        Myscroll.contentSize.height = 600
    }
    
    func setTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissed))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    @objc func handleDismissed(){
        self.view.endEditing(true)
    }
    
    @objc func doneButtonpress(){
        if let  datePicker = self.EndDate.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.EndDate.text = dateFormatter.string(from: datePicker.date)
        }
         self.EndDate.resignFirstResponder()
    }

    
    func layout(){
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
       
        
        Myscroll.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: nil, top: Header.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Myscroll.contentSize.height = 600
        
        Myscroll.addSubview(mytitle)
        Myscroll.addSubview(Historyimg)
        Myscroll.addSubview(back)
        Myscroll.addSubview(usertf)
        Myscroll.addSubview(FrmDate)
        Myscroll.addSubview(EndDate)
        Myscroll.addSubview(Asset)
        Myscroll.addSubview(search)
        
        mytitle.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: Myscroll.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        Historyimg.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: mytitle.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        Historyimg.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.2, constHeight: 0.1)
        
        usertf.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: Historyimg.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 80, left: 0, bottom: 0, right: 0))
        usertf.anchorWith_WidthHeight(width: Myscroll.widthAnchor, height: nil, constWidth: 0.7, constHeight: SIZE.HISTXT_HEIGHT)
        
        FrmDate.anchorWith_TopLeftBottomRight_Padd(top: usertf.bottomAnchor, left: usertf.leadingAnchor, bottom: nil, right: usertf.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        FrmDate.anchorWith_Height(height: usertf.heightAnchor, const: 1)
        
        EndDate.anchorWith_TopLeftBottomRight_Padd(top: FrmDate.bottomAnchor, left: usertf.leadingAnchor, bottom: nil, right: usertf.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        EndDate.anchorWith_Height(height: usertf.heightAnchor, const: 1)
        
        Asset.anchorWith_TopLeftBottomRight_Padd(top: EndDate.bottomAnchor, left: usertf.leadingAnchor, bottom: nil, right: usertf.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        Asset.anchorWith_Height(height: usertf.heightAnchor, const: 1)
        
        back.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: mytitle.centerYAnchor, top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        
        
        search.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: Asset.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        search.anchorWith_WidthHeight(width: Myscroll.widthAnchor, height: nil, constWidth: 0.4, constHeight: SIZE.SEARCH_HEIGHT)

    }

}
