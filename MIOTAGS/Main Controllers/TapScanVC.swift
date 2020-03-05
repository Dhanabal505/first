//
//  TapScanVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 06/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class TapScanVC: UIViewController {
    
    
    var picker = UIImagePickerController();
    
    
    lazy var Header:CustomMenuHeader={
        let view = CustomMenuHeader(title: "")
        view?.translatesAutoresizingMaskIntoConstraints=false
        return view!
    }()

    
    lazy var assetid:UnderlineTf={
        let tf = UnderlineTf()
        tf.translatesAutoresizingMaskIntoConstraints=false
        return tf
    }()
    
    lazy var orlbl:UILabel={
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints=false
        lbl.text = "OR"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
   
   
    lazy var togglebtn:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(named: "tapon"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    
    lazy var switchbtn:UISwitch={
      let swtch = UISwitch(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        swtch.translatesAutoresizingMaskIntoConstraints=false
        swtch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
       return swtch
    }()
    

    lazy var mybtn:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.tag = 0
        btn.setImage(UIImage(named: "tap"), for: .normal)
        btn.addTarget(self, action: #selector(btnsacts), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "Tap or Scan")
        return lbl
    }()
    
    
    lazy var back:UIButton={
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(named: "left"), for: .normal)
        btn.addTarget(self, action: #selector(backact), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Setsubview()
       
         layout()
        attributetext()
       
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
       
    }
    
    
    func Setsubview(){
        view.addSubview(togglebtn)
        view.addSubview(mybtn)
        view.addSubview(Header)
        view.addSubview(switchbtn)
        view.addSubview(back)
        view.addSubview(mytitle)
        view.addSubview(assetid)
        view.addSubview(orlbl)
        view.addGestureRecognizer(swipe)
    }
    
    
    let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))

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
    
  
    
    @objc func switchValueDidChange(_ sender: UISwitch!) {
        
        
        if (sender.isOn == true ) {
            
            
            switchbtn.backgroundColor = UIColor(patternImage: UIImage(named: "tap")!)
            mybtn.setImage(UIImage(named: "scan"), for: .normal)
            mybtn.tag = 1
            mybtn.addTarget(self, action: #selector(btnsacts), for: .touchUpInside)
            togglebtn.setImage(UIImage(named: "scanon"), for: .normal)
        }
        
        else {

            mybtn.setImage(UIImage(named: "tap"), for: .normal)
            mybtn.tag = 0
            mybtn.addTarget(self, action: #selector(btnsacts), for: .touchUpInside)
            togglebtn.setImage(UIImage(named: "tapon"), for: .normal)
        }

    }
    
    @objc func btnsacts(){
        
    if  mybtn.tag == 0 {
        print("tag1")
        let vc = storyboard?.instantiateViewController(withIdentifier: "TapVC") as! TapVC
        navigationController?.pushViewController(vc, animated: true)
    }
     else if mybtn.tag == 1 {
            let scanvc = storyboard?.instantiateViewController(withIdentifier: "Tagfailure") as! Tagfailure
            navigationController?.pushViewController(scanvc, animated: true)
        }
    }
    
    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
 
    
    
    func layout(){
        
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        mytitle.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 50, left: 0, bottom: 0, right: 0))
        mytitle.anchorWith_XY_Padd(x: switchbtn.centerXAnchor, y: nil)
        mytitle.textAlignment = .center
        
        mybtn.anchorWith_XY_Padd(x: view.centerXAnchor, y: view.centerYAnchor)
        mybtn.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.7, constHeight: 0.3)
       
        
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        back.imageView?.contentMode = .scaleAspectFit
      
     
        switchbtn.anchorWith_XY_Padd(x: togglebtn.centerXAnchor, y: togglebtn.centerYAnchor)
        switchbtn.transform = CGAffineTransform(scaleX: 2.5, y: 0.75)
        switchbtn.thumbTintColor = UIColor.clear
        switchbtn.onTintColor = UIColor.clear
        switchbtn.tintColor = UIColor.clear
      
        
        
        togglebtn.anchorWith_XY_Padd(x: view.centerXAnchor, y: nil)
        togglebtn.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: mybtn.topAnchor, right: nil, padd: .init(top: 0, left: 0, bottom: -50, right: 0))
        togglebtn.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.3, constHeight: 0.06)

        
        
        
        orlbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        orlbl.anchorWith_TopLeftBottomRight_Padd(top: mybtn.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 35, left: 0, bottom: 0, right: 0))
        
        
       
        assetid.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: orlbl.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 25, left: 30, bottom: 0, right: -40))
        
        
        
       
    }
    
    func attributetext(){
                let mystring = "Search by UID/Asset ID"
                let clrstring = "UID/Asset ID"
                let range = (mystring as NSString).range(of: clrstring)
                let attribute = NSMutableAttributedString.init(string: mystring)
                attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue , range: range)
               assetid.attributedPlaceholder = attribute
    }

}
