//
//  OptionVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 09/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class OptionVC: UIViewController {

    
    @IBOutlet weak var info: UIButton!
    @IBOutlet weak var maps: UIButton!
    @IBOutlet weak var notes: UIButton!
    @IBOutlet weak var pics: UIButton!
    @IBOutlet weak var web: UIButton!
    @IBOutlet weak var ficha: UILabel!
    @IBOutlet weak var mapslbl: UILabel!
    @IBOutlet weak var noteslbl: UILabel!
    @IBOutlet weak var picslbkl: UILabel!
    @IBOutlet weak var weblbl: UILabel!
    
    
    lazy var Header:CustomMenuHeader={
        let side = CustomMenuHeader(title: "")
        return side!
    }()
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "OPTIONS")
        return lbl
    }()
    
    
    lazy var back:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "left"), for: .normal)
        return btn
    }()
    
    
    let myview = UIView()
    
    lazy var mylbl:CustomLBL={
        let lbl = CustomLBL(title: "Active ID or UID")
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(Header)
        view.addSubview(myview)
        view.addSubview(mylbl)
        view.addSubview(mytitle)
        view.addSubview(back)
        translate()
        layout()
        targets()
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        
        web.addTarget(self, action: #selector(webact), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
    }
    var sideMenu = SideMenuLauncher()
    
    
    @objc func  handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        
        print("Swipe Right")
        sideMenu.showSideMenu()
        
        if gesture.direction == .right {
            print("Swipe Right")
        }
        else if gesture.direction == .left {
            print("Swipe Left")
            sideMenu.showSideMenu()
            
        }
        else if gesture.direction == .up {
            print("Swipe Up")
        }
        else if gesture.direction == .down {
            print("Swipe Down")
        }
    }
    
    func targets(){
        
        info.addTarget(self, action: #selector(infoact), for: .touchUpInside)
        maps.addTarget(self, action: #selector(mapact), for: .touchUpInside)
        notes.addTarget(self, action: #selector(notesact), for: .touchUpInside)
        pics.addTarget(self, action: #selector(picsact), for: .touchUpInside)
        
    }
    
    
    
    
    func translate(){
        Header.translatesAutoresizingMaskIntoConstraints=false
        info.translatesAutoresizingMaskIntoConstraints=false
        maps.translatesAutoresizingMaskIntoConstraints=false
        notes.translatesAutoresizingMaskIntoConstraints=false
        pics.translatesAutoresizingMaskIntoConstraints=false
        web.translatesAutoresizingMaskIntoConstraints=false
        ficha.translatesAutoresizingMaskIntoConstraints=false
        mapslbl.translatesAutoresizingMaskIntoConstraints=false
        noteslbl.translatesAutoresizingMaskIntoConstraints=false
        picslbkl.translatesAutoresizingMaskIntoConstraints=false
        weblbl.translatesAutoresizingMaskIntoConstraints=false
        myview.translatesAutoresizingMaskIntoConstraints=false
        mylbl.translatesAutoresizingMaskIntoConstraints=false
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
    }
    
    
    @objc func webact(){
        if let url = NSURL(string: Asset.prtyweb!){
            UIApplication.shared.openURL(url as URL)
    }
    }
    
    func layout(){
        
        
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        
        info.anchorWith_XY_Padd(x: nil, y: view.centerYAnchor, padd: .init(top: -80, left: 0, bottom: 0, right: 0))
        info.anchorWith_TopLeftBottomRight_Padd(top: nil, left: view.leadingAnchor, bottom: nil, right: nil ,padd: .init(top: 0, left: 30, bottom: 0, right: 0))
        info.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.25, constHeight: 0.1)
        info.setImage(UIImage(named: "info"), for: .normal)
        
        
        
        maps.anchorWith_XY_Padd(x: nil, y: view.centerYAnchor, padd: .init(top: -80, left: 0, bottom: 0, right: 0))
        maps.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: view.trailingAnchor,padd: .init(top: 0, left: 0, bottom: 0, right: -30))
        maps.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.25, constHeight: 0.1)
        maps.setImage(UIImage(named: "maps"), for: .normal)
        
        
        
        notes.anchorWith_TopLeftBottomRight_Padd(top: ficha.bottomAnchor, left: info.leadingAnchor, bottom: nil, right: nil,padd: .init(top: 40, left: 0, bottom: 0, right: 0))
        notes.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.25, constHeight: 0.1)
        notes.setImage(UIImage(named: "notes"), for: .normal)
        
        
        pics.anchorWith_TopLeftBottomRight_Padd(top: mapslbl.bottomAnchor, left: nil, bottom: nil, right: maps.trailingAnchor,padd: .init(top: 40, left: 0, bottom: 0, right: 0))
        pics.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.25, constHeight: 0.1)
        pics.setImage(UIImage(named: "pics"), for: .normal)
        
        web.anchorWith_XY_Padd(x: view.centerXAnchor, y: nil, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        web.anchorWith_TopLeftBottomRight_Padd(top: picslbkl.bottomAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 40, left: 0, bottom: 0, right: 0))
        web.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.25, constHeight: 0.1)
        web.setImage(UIImage(named: "web"), for: .normal)
        
        ficha.lbl(name: "FICHA")
        ficha.anchorWith_XY_Padd(x: info.centerXAnchor, y: nil)
        ficha.anchorWith_TopLeftBottomRight_Padd(top: info.bottomAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        
        mapslbl.lbl(name: "MAPS")
        mapslbl.anchorWith_XY_Padd(x: maps.centerXAnchor, y: nil)
        mapslbl.anchorWith_TopLeftBottomRight_Padd(top: maps.bottomAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        
        noteslbl.lbl(name: "NOTES")
        noteslbl.anchorWith_XY_Padd(x: notes.centerXAnchor, y: nil)
        noteslbl.anchorWith_TopLeftBottomRight_Padd(top: notes.bottomAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        
        picslbkl.lbl(name: "PICS")
        picslbkl.anchorWith_XY_Padd(x: pics.centerXAnchor, y: nil)
        picslbkl.anchorWith_TopLeftBottomRight_Padd(top: pics.bottomAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        weblbl.lbl(name: "WEB")
        weblbl.anchorWith_XY_Padd(x: web.centerXAnchor, y: nil)
        weblbl.anchorWith_TopLeftBottomRight_Padd(top: web.bottomAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        
        mytitle.anchorWith_XY_Padd(x: myview.centerXAnchor, y: nil)
        mytitle.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: myview.topAnchor, right: nil,padd: .init(top: 0, left: 0, bottom: -20, right: 0))
        
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        back.imageView?.contentMode = .scaleAspectFit
        
        myview.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 100, left: 0, bottom: 0, right: 0))
        myview.anchorWith_XY_Padd(x: view.centerXAnchor, y: nil)
        myview.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.6, constHeight: 0.01)
        myview.backgroundColor = UIColor.white
        myview.layer.cornerRadius = 10
        
        mylbl.anchorWith_TopLeftBottomRight_Padd(top: myview.bottomAnchor, left: nil, bottom: nil
            , right: nil,padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        mylbl.anchorWith_XY_Padd(x: myview.centerXAnchor, y: nil)
    }
    
    @objc func infoact(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "InfoVC")as! InfoVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func mapact(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "MApVC")as! MApVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func notesact(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "NotesVC")as! NotesVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func picsact(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "PicVC")as! PicVC
        navigationController?.pushViewController(vc, animated: true)
    }
}
