//
//  Sidemenu.swift
//  MIOTAGS
//
//  Created by Dhanabal on 06/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class SideMenuLauncher: NSObject{
   
    
    lazy var sideView:UIView={
        let view=UIView()
        view.backgroundColor = UIColor().hexToColor(hex: "004c8c")
        view.alpha = 1
        return view
    }()
    
  
    
    lazy var prficon:UIImageView={
        let img=UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        return img
    }()
    
    lazy var dashicon:UIImageView={
        let img=UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        return img
    }()
    
    lazy var cmpny:UILabel={
        let lbl=UILabel()
        lbl.text = "Hello"
        lbl.translatesAutoresizingMaskIntoConstraints=false
        lbl.textColor = UIColor.white
        return lbl
    }()
    
  
    
    lazy var position:UILabel={
        let lbl=UILabel()
        lbl.text = "test"
        lbl.translatesAutoresizingMaskIntoConstraints=false
        lbl.textColor = UIColor.white
        return lbl
    }()
    
    
    
    lazy var name:UILabel={
        let lbl=UILabel()
        lbl.text = "miotag"
        lbl.translatesAutoresizingMaskIntoConstraints=false
        lbl.textColor = UIColor.white
        return lbl
    }()

    
    lazy var myprofile:Menubtn={
        let btn = Menubtn()
        btn.setTitle("My Profile", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
  
    
    lazy var Support:Menubtn={
        let btn = Menubtn()
        btn.setTitle("Support", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
    
    lazy var Tapscan:Menubtn={
        let btn = Menubtn()
        btn.setTitle("Tap or Scan", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
 
    
    lazy var History:Menubtn={
        let btn = Menubtn()
        btn.setTitle("History", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
    
    lazy var Logout:UIButton={
        let btn = UIButton()
        btn.setTitle("Logout", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
    lazy var sprticon:UIImageView={
        let img=UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        return img
    }()
    
    
    lazy var tapscanicon:UIImageView={
        let img=UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        return img
    }()
    
    lazy var historyicon:UIImageView={
        let img=UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        return img
    }()

    
    lazy var logouticon:UIImageView={
        let img=UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        return img
    }()
    

    
    let blackview = UIView()
    var widthConst:CGFloat = 0
    let statusConst:CGFloat=0
    
    func showSideMenu(){
        
        if let window = UIApplication.shared.keyWindow{
           
            blackview.backgroundColor = UIColor.clear
            
            widthConst = (window.frame.width / 2)+60
            
           
            window.addSubview(sideView)
            window.addSubview(blackview)
            
            sideView.frame=CGRect(x:-widthConst, y: statusConst, width: widthConst, height: window.frame.height)
            
            sideView.layer.shadowColor = UIColor.darkGray.cgColor
            
            
           
            blackview.frame=CGRect(x: widthConst, y: statusConst, width: widthConst, height: window.frame.height)
            blackview.alpha=0
            
            blackview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))

            let gradientLayer:CAGradientLayer = CAGradientLayer()
            gradientLayer.frame.size = sideView.frame.size
            gradientLayer.colors = [UIColor().hexToColor(hex: "#004c8c"),UIColor().hexToColor(hex: "#4fc3f7").cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            sideView.layer.addSublayer(gradientLayer)
        
    
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackview.alpha = 1
                self.sideView.frame=CGRect(x: 0, y: self.statusConst, width: self.widthConst, height: window.frame.height)
            }) { (completed) in
                
            }
            
        }
        
       setupContainer()
        
    }
    
    //MARK:- Action Function
    @objc func handleSwipeLeft(){
        
        handleDismiss()
    }
    
    @objc func handleLogout(){
        actionClicked()
    }
    
    @objc func handleDismiss(){
        
        UIView.animate(withDuration: 0.5) {
    
            if let window = UIApplication.shared.keyWindow{
                self.sideView.frame=CGRect(x: -(self.widthConst), y: 0, width: self.widthConst, height: window.frame.height)
                self.blackview.frame=CGRect(x: -(self.widthConst), y: 0, width: self.widthConst, height: window.frame.height)
            }
        }
    }
    
    func setupContainer(){
        
       
        sideView.addSubview(cmpny)
        sideView.addSubview(position)
        sideView.addSubview(name)
        //sideView.addSubview(Dashboard)
        sideView.addSubview(prficon)
        sideView.addSubview(myprofile)
        sideView.addSubview(Support)
        sideView.addSubview(Tapscan)
        sideView.addSubview(History)
        sideView.addSubview(Logout)
        sideView.addSubview(sprticon)
        sideView.addSubview(tapscanicon)
        sideView.addSubview(historyicon)
        sideView.addSubview(logouticon)
        sideView.addSubview(dashicon)
        setupLayout()
    }
    
    func setupLayout(){
        
        
        cmpny.anchorWith_TopLeftBottomRight_Padd(top: sideView.safeAreaLayoutGuide.topAnchor, left: sideView.leadingAnchor, bottom: nil, right: nil,padd: .init(top: 10, left: 10, bottom: 0, right: 0))


        
        position.anchorWith_TopLeftBottomRight_Padd(top: cmpny.bottomAnchor, left: sideView.leadingAnchor, bottom: nil, right: nil,padd: .init(top: 5, left: 10, bottom: 0, right: 0))
 
        
        name.anchorWith_TopLeftBottomRight_Padd(top: position.bottomAnchor, left: sideView.leadingAnchor, bottom: nil, right: nil,padd: .init(top: 5, left: 10, bottom: 0, right: 0))
        

        
         prficon.contentMode = .scaleToFill
         prficon.image = UIImage(named: "profilemenu")
         prficon.anchorWith_TopLeftBottomRight_Padd(top: myprofile.topAnchor, left: nil, bottom: myprofile.bottomAnchor, right: myprofile.trailingAnchor,padd: .init(top: 0, left: 0, bottom: 0, right: -20))
         prficon.anchorWith_WidthHeight(width: sideView.widthAnchor, height: sideView.heightAnchor, constWidth: 0.15, constHeight: 0.05)
        
         myprofile.anchorWith_TopLeftBottomRight_Padd(top: name.bottomAnchor, left: sideView.leadingAnchor, bottom: nil, right: sideView.trailingAnchor,padd: .init(top: 70, left: 10, bottom: 0, right: 0))
        myprofile.anchorWith_WidthHeight(width: sideView.widthAnchor, height: nil, constWidth: 1, constHeight: 0)
        myprofile.contentHorizontalAlignment = .left
        
        Support.anchorWith_TopLeftBottomRight_Padd(top: myprofile.bottomAnchor, left: myprofile.leadingAnchor, bottom: nil, right: nil,padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        Support.anchorWith_WidthHeight(width: sideView.widthAnchor, height: nil, constWidth: 1, constHeight: 0)
        Support.contentHorizontalAlignment = .left
        
        Tapscan.anchorWith_TopLeftBottomRight_Padd(top: Support.bottomAnchor, left: myprofile.leadingAnchor, bottom: nil, right: nil,padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        Tapscan.anchorWith_WidthHeight(width: sideView.widthAnchor, height: nil, constWidth: 1, constHeight: 0)
        Tapscan.contentHorizontalAlignment = .left
        
        History.anchorWith_TopLeftBottomRight_Padd(top: Tapscan.bottomAnchor, left: myprofile.leadingAnchor, bottom: nil, right: nil,padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        History.anchorWith_WidthHeight(width: sideView.widthAnchor, height: nil, constWidth: 1, constHeight: 0)
        History.contentHorizontalAlignment = .left
        
        Logout.anchorWith_TopLeftBottomRight_Padd(top: History.bottomAnchor, left: myprofile.leadingAnchor, bottom: nil, right: nil,padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        Logout.anchorWith_WidthHeight(width: sideView.widthAnchor, height: nil, constWidth: 1, constHeight: 0)
        Logout.contentHorizontalAlignment = .left

        sprticon.contentMode = .scaleToFill
        sprticon.image = UIImage(named: "msgmenu")
        sprticon.anchorWith_TopLeftBottomRight_Padd(top: Support.topAnchor, left: nil, bottom: Support.bottomAnchor, right: myprofile.trailingAnchor,padd: .init(top: 0, left: 0, bottom: 0, right: -20))
        sprticon.anchorWith_WidthHeight(width: sideView.widthAnchor, height: sideView.heightAnchor, constWidth: 0.15, constHeight: 0.05)
        
        tapscanicon.contentMode = .scaleToFill
        tapscanicon.image = UIImage(named: "bar")
        tapscanicon.anchorWith_TopLeftBottomRight_Padd(top: Tapscan.topAnchor, left: nil, bottom: Tapscan.bottomAnchor, right: myprofile.trailingAnchor,padd: .init(top: 0, left: 0, bottom: 0, right: -20))
        tapscanicon.anchorWith_WidthHeight(width: sideView.widthAnchor, height: sideView.heightAnchor, constWidth: 0.15, constHeight: 0.05)

        historyicon.contentMode = .scaleToFill
        historyicon.image = UIImage(named: "historymenu")
        historyicon.anchorWith_TopLeftBottomRight_Padd(top: History.topAnchor, left: nil, bottom: History.bottomAnchor, right: myprofile.trailingAnchor,padd: .init(top: 0, left: 0, bottom: 0, right: -20))
        historyicon.anchorWith_WidthHeight(width: sideView.widthAnchor, height: sideView.heightAnchor, constWidth: 0.15, constHeight: 0.05)
       
        
        logouticon.contentMode = .scaleToFill
        logouticon.image = UIImage(named: "logouts")
        logouticon.anchorWith_TopLeftBottomRight_Padd(top: Logout.topAnchor, left: nil, bottom: Logout.bottomAnchor, right: myprofile.trailingAnchor,padd: .init(top: 0, left: 0, bottom: 0, right: -20))
        logouticon.anchorWith_WidthHeight(width: sideView.widthAnchor, height: sideView.heightAnchor, constWidth: 0.15, constHeight: 0.05)
        

        
    }
    
    func actionClicked(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            if let window = UIApplication.shared.keyWindow{
                self.sideView.frame=CGRect(x: -(self.widthConst), y: 0, width: self.widthConst, height: window.frame.height)
            }
        }) { (completed:Bool) in
        }
    }
    
    
    
   
    
    
    let vc = NavigationModel.vcViewModel
    
   
    
    @objc func myprofileact(){
        
        let profile = vc.storyboard?.instantiateViewController(withIdentifier: "MyprofileVC")as! MyprofileVC
        vc.navigationController?.pushViewController(profile, animated: true)
        handleDismiss()
    }
    
    @objc func supportact(){
        
        let profile = vc.storyboard?.instantiateViewController(withIdentifier: "SupportVC")as! SupportVC
        vc.navigationController?.pushViewController(profile, animated: true)
        handleDismiss()
    }
    
    
    @objc func tapscanact(){
        
        let profile = vc.storyboard?.instantiateViewController(withIdentifier: "TapScanVC")as! TapScanVC
        vc.navigationController?.pushViewController(profile, animated: true)
        handleDismiss()
    }
    
    @objc func historyact(){
        
        let profile = vc.storyboard?.instantiateViewController(withIdentifier: "HistoryVC")as! HistoryVC
        vc.navigationController?.pushViewController(profile, animated: true)
        handleDismiss()
    }
    
    @objc func logoutact(){
        
        let alert = UIAlertController(title: "", message: "Are you sure you want to logout?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "YES", style: .default) { (action) in
            self.vc.navigationController?.popToRootViewController(animated: true)
        }
        let no = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        alert.addAction(yes)
        alert.addAction(no)
        vc.present(alert, animated: true, completion: nil)
        handleDismiss()
    }
    
    
    override init() {
        super.init()
        
        
        
     
        print("Init Side Menu")
        
       
        myprofile.addTarget(self, action: #selector(myprofileact), for: .touchUpInside)
        Support.addTarget(self, action: #selector(supportact), for: .touchUpInside)
        Tapscan.addTarget(self, action: #selector(tapscanact), for: .touchUpInside)
        History.addTarget(self, action: #selector(historyact), for: .touchUpInside)
        Logout.addTarget(self, action: #selector(logoutact), for: .touchUpInside)
        
    }
}


