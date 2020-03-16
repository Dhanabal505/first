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

    lazy var Myscroll:UIScrollView={
        let scrl = UIScrollView()
        scrl.translatesAutoresizingMaskIntoConstraints=false
        return scrl
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
        let lbl = CustomLBL(title: "TAP OR SCAN")
        return lbl
    }()
    
    
    lazy var back:UIButton={
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(named: "left"), for: .normal)
        btn.addTarget(self, action: #selector(backact), for: .touchUpInside)
        return btn
    }()
    
    lazy var search:CustomBTN={
        let btn = CustomBTN(title: "SEARCH")
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Setsubview()
        setTapGesture()
         layout()
        attributetext()
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    

    
    func Setsubview(){
        
        view.addSubview(Header)
        view.addSubview(Myscroll)
        Myscroll.addSubview(togglebtn)
        Myscroll.addSubview(mybtn)
        Myscroll.addSubview(switchbtn)
        Myscroll.addSubview(back)
        Myscroll.addSubview(mytitle)
        Myscroll.addSubview(assetid)
        Myscroll.addSubview(orlbl)
        Myscroll.addSubview(search)
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
    
    
    func setTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissed))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    @objc func handleDismissed(){
        self.view.endEditing(true)
    }
    
    
    
    var scrollOffset : CGFloat = 0
    var distance : CGFloat = 0
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            var safeArea = self.view.frame
            safeArea.size.height += Myscroll.contentOffset.y
            safeArea.size.height -= keyboardSize.height + (UIScreen.main.bounds.height*0.12)
            
            let activeField: UIView? = [assetid].first { $0.isFirstResponder }
            if let activeField = activeField {
                if safeArea.contains(CGPoint(x: 0, y: activeField.frame.maxY)) {
                    print("No need to Scroll")
                    return
                } else {
                    distance = activeField.frame.maxY - safeArea.size.height
                    scrollOffset = Myscroll.contentOffset.y
                    self.Myscroll.setContentOffset(CGPoint(x: 0, y: scrollOffset + distance), animated: true)
                }
            }
           
            
            Myscroll.isScrollEnabled = false
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if distance == 0 {
            return
        }
        self.Myscroll.setContentOffset(CGPoint(x: 0, y: scrollOffset ), animated: true)
        scrollOffset = 0
        distance = 0
        Myscroll.isScrollEnabled = true
        Myscroll.contentSize.height = 900
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
        
        
        Myscroll.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: nil, top: Header.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Myscroll.contentSize.height = 600
        
        mytitle.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: Myscroll.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        mybtn.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: togglebtn.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 40, left: 0, bottom: 0, right: 0))
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
      
        
        
        togglebtn.anchorWith_XY_Padd(x: Myscroll.centerXAnchor, y: nil)
        togglebtn.anchorWith_TopLeftBottomRight_Padd(top: mytitle.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        togglebtn.anchorWith_WidthHeight(width: Myscroll.widthAnchor, height: view.heightAnchor, constWidth: 0.3, constHeight: 0.06)
        
        
        
        
        orlbl.centerXAnchor.constraint(equalTo: Myscroll.centerXAnchor).isActive=true
        orlbl.anchorWith_TopLeftBottomRight_Padd(top: mybtn.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 35, left: 0, bottom: 0, right: 0))
        
        
       
        assetid.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: orlbl.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 25, left: 0, bottom: 0, right: 0))
        assetid.anchorWith_Width(width: Myscroll.widthAnchor, const: 0.7)
        
        search.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: assetid.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 50, left: 0, bottom: 0, right: 0))
        search.anchorWith_WidthHeight(width: Myscroll.widthAnchor, height: nil, constWidth: 0.4, constHeight: SIZE.SEARCH_HEIGHT)
        
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
