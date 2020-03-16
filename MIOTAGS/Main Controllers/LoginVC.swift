//
//  LoginVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 03/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField


class LoginVC: UIViewController  {
    
    lazy var HeaderLogo:CustomHeader={
        let logo = CustomHeader(title: "")
        logo?.translatesAutoresizingMaskIntoConstraints = false
        return logo!
    }()
    
    
    
    lazy var loginview:CustomView = {
        let view = CustomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var usne:UnderlineTf={
        let tf = UnderlineTf()
        tf.translatesAutoresizingMaskIntoConstraints=false
        tf.placeholder = "Username"
        return tf
    }()
    
    lazy var mail:UnderlineTf={
        let tf = UnderlineTf()
        tf.translatesAutoresizingMaskIntoConstraints=false
        tf.placeholder = "Email"
        return tf
    }()
    
    lazy var pass:showhide={
        let tf =  showhide()
        tf.translatesAutoresizingMaskIntoConstraints=false
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
//    lazy var forgotpass:UIButton={
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints=false
//        btn.setTitle("forgot your password?", for: .normal)
//        btn.setTitleColor(UIColor.black, for: .normal)
//        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        btn.addTarget(self, action: #selector(Forgotpassact), for: .touchUpInside)
//        return btn
//    }()
    
    lazy var remember: checkbox = {
        let btn = checkbox()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setTitle("Remember me", for: .normal)
        btn.addTarget(self, action: #selector(rmact), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var terms:checkbox={
        let btn = checkbox()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setTitle("I accept the polices & terms", for: .normal)
        btn.addTarget(self, action: #selector(termsact), for: .touchUpInside)
        return btn
    }()
    
  
    lazy var login:UIButton={
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(named: "login"), for: .normal)
        btn.addTarget(self, action: #selector(loginact), for: .touchUpInside)
        return btn
    }()
 
    lazy var errorlable: UILabel={
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints=false
        lbl.isUserInteractionEnabled = true
        lbl.textColor = UIColor.red
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        return lbl
    }()
    

    
    var vLoginVwHeight:NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
         SetSubViews()
         layout()
         Remember()
         setTapGesture()
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
       vLoginVwHeight?.constant = 240
       errorlable.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginVC.tapFunction))
        errorlable.addGestureRecognizer(tap)
        
        
    }

    func setTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissed))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    @objc func handleDismissed(){
        self.view.endEditing(true)
    }
  
    
    func labeltext(){

        let attributedStr = NSMutableAttributedString.init(string: "Access details are not correct, please contact support or try to log in again")
        attributedStr.addAttribute(.link, value: UILabel.self, range: NSRange.init(location: 47, length: 7))
        attributedStr.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange.init(location: 47, length: 7))
        attributedStr.addAttribute(.underlineColor, value: UIColor.blue, range: NSRange.init(location: 47, length: 7))
        attributedStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .semibold), range: NSRange.init(location: 47, length: 7))
        attributedStr.addAttribute(.underlineStyle, value: 1, range:NSRange.init(location: 47, length: 7))
        errorlable.attributedText = attributedStr

        self.errorlable.isUserInteractionEnabled = true

    }
    
    
    func Remember(){
        
        
        let defaults: UserDefaults? = UserDefaults.standard
        
        
        if (defaults?.bool(forKey: "Remember"))! {
            usne.text = defaults?.value(forKey: "SavedUserName") as? String
            mail.text = defaults?.value(forKey: "SavedMail") as? String
            pass.text = defaults?.value(forKey: "SavedPassword") as? String
            remember.isChecked = true
        } else {
            remember.isChecked = false
        }
    }
    
    
    func SetSubViews(){
        
        view.addSubview(loginview)
        view.addSubview(HeaderLogo)
        view.addSubview(terms)
        view.addSubview(login)
    }
    
    
    
 // Button Actions
    
    @objc func rmact(){
        remember.isChecked = !remember.isChecked
      
    }
    
    @objc func termsact(){
        terms.isChecked = !terms.isChecked
        
        if terms.isChecked == true {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TermsVC") as! TermsVC
            navigationController?.pushViewController(vc, animated: true)
            print("good")
            terms.isChecked = true
        }
    }
    
    @objc func Forgotpassact(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotpassVC") as! ForgotpassVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        
        print("tap working")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ErrorSupportVC") as! ErrorSupportVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func validateLogin(){
//        let strUserName = usne.text
//        let strEmail = mail.text
//        let strPassword = pass.text
//
//        let data = ["UserName":strUserName,"Email":strEmail,"password":strPassword,"grant_type":"password"] as! [String:String]
//        loginAPI(data: data)
//    }
//
//    func loginAPI(data:[String:String]){
//
//
//        let loader = LoaderView()
//        loader.showLoader()
//
//        APIs.login(data: data) { (userData, error) in
//            loader.hideLoader()
//
//            let support = self.storyboard?.instantiateViewController(withIdentifier: "TapScanVC")as! TapScanVC
//            self.navigationController?.pushViewController(support, animated: true)
//
//
//            if error != nil{
//                switch error {
//                case .connectionError?:
//                    print("Connection Error")
//                   // self.makeToast(strMessage: STRING.INTERNET_CONNECTION)
//                    break
//                case .noDataAvailable?:
//                    print("No Data Available")
//                   // self.makeToast(strMessage: STRING.NO_DATA)
//                    break
//                case .serverError?:
//                    print("Server Error")
//                   // self.makeToast(strMessage: "Server Error")
//                    break
//                case .invalidData?:
//                    //self.makeToast(strMessage: STRING.INVALID_USER)
//                    break
//                default:
//                    print("No Data")
//                }
//                return
//            }
//
//
//            //print("User Data - \(String(describing: userData))")
//
////            if self.remember.isChecked{
////                DataModel.setUserDefault(strKey: USERDEFAULT.USERNAME, data: self.usne.text!)
////                DataModel.setUserDefault(strKey: USERDEFAULT.PASSWORD, data: self.pass.text!)
////            }
////            else{
////                DataModel.removeUserDefault()
////            }
//            if User.Role == "Primary"{
//            print("True")
//                let support = self.storyboard?.instantiateViewController(withIdentifier: "TapScanVC")as! TapScanVC
//                self.navigationController?.pushViewController(support, animated: true)
//            } else{
//                print(false)
//                let support = self.storyboard?.instantiateViewController(withIdentifier: "TapScanVC")as! TapScanVC
//                self.navigationController?.pushViewController(support, animated: true)
//            }
//        }
//        }
//
    
    @objc func loginact(){
        
        //validateLogin()
        print("Test")
        let defaults: UserDefaults? = UserDefaults.standard
        if remember.isChecked == true {
            defaults?.set(true, forKey: "Remember")
            defaults?.set(usne.text, forKey: "SavedUserName")
            defaults?.set(mail.text, forKey: "SavedMail")
            defaults?.set(pass.text, forKey: "SavedPassword")

        } else {
            defaults?.set(false, forKey: "Remember")

        }
        
        guard usne.text?.count != 0 else {
            self.makeToast(strMessage: "Username is empty")
            return
        }
        
        guard mail.text?.count != 0 else {
            self.makeToast(strMessage: "Mail Id is empty")
            return
        }
        
        guard pass.text?.count != 0 else {
            self.makeToast(strMessage: "Password is empty")
            return
        }


        if usne.text!.count == 4  {
            let support = storyboard?.instantiateViewController(withIdentifier: "TapScanVC")as! TapScanVC
            navigationController?.pushViewController(support, animated: true)


        }
        else {

            errorlable.isHidden = false
            labeltext()
            vLoginVwHeight?.constant = 290
        }
    }
    
   
    

    
    
 // Constarints
    
    func layout(){
        
        
        HeaderLogo.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        HeaderLogo.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        loginview.anchorWith_XY_Padd(x: view.centerXAnchor, y: view.centerYAnchor,padd: .init(top: -30, left: 0, bottom: 0, right: 0))
        loginview.anchorWith_Width(width: view.widthAnchor, const: 0.8)
    
        vLoginVwHeight=loginview.heightAnchor.constraint(equalToConstant: 260)
        vLoginVwHeight?.isActive=true
        
        
        loginview.addSubview(usne)
        loginview.addSubview(mail)
        loginview.addSubview(pass)
      //  loginview.addSubview(forgotpass)
        loginview.addSubview(remember)
        loginview.addSubview(errorlable)
    
        
        
        usne.anchorWith_TopLeftBottomRight_Padd(top: loginview.topAnchor, left: loginview.leadingAnchor, bottom: nil, right: loginview.trailingAnchor, padd: .init(top: 20, left: 10, bottom: 0, right: -10))
       

        mail.anchorWith_TopLeftBottomRight_Padd(top: usne.bottomAnchor, left: usne.leadingAnchor, bottom: nil, right: usne.trailingAnchor, padd: .init(top: 15, left: 0, bottom: 0, right: 0))
       
        
        pass.anchorWith_TopLeftBottomRight_Padd(top: mail.bottomAnchor, left: usne.leadingAnchor, bottom: nil, right: usne.trailingAnchor, padd: .init(top: 15, left: 0, bottom: 0, right: 0))
       
        

//        forgotpass.anchorWith_TopLeftBottomRight_Padd(top: remember.bottomAnchor, left: nil, bottom: nil, right: usne.trailingAnchor, padd: .init(top: 15, left: 0, bottom: 0, right: 0))
      
        
        errorlable.anchorWith_TopLeftBottomRight_Padd(top: nil, left: loginview.leadingAnchor, bottom: loginview.bottomAnchor, right: loginview.trailingAnchor , padd: .init(top: 0, left: 10, bottom: -10, right: -10))
        errorlable.isHidden = true
        
        
        terms.anchorWith_TopLeftBottomRight_Padd(top: loginview.bottomAnchor, left: loginview.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 35, left: 10, bottom: 0, right: 0))
        terms.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 360, constHeight: 20)
        terms.imageEdgeInsets = UIEdgeInsets(top: 0, left: -240, bottom: 0, right: 0)
        terms.titleEdgeInsets = UIEdgeInsets(top: 0, left: -470, bottom: 0, right: 0)
        
        
        remember.anchorWith_TopLeftBottomRight_Padd(top: pass.bottomAnchor, left: loginview.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 20, left: 10, bottom: 0, right: 0))
        remember.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 160, constHeight: 20)
        remember.imageEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
        remember.titleEdgeInsets = UIEdgeInsets(top: 0, left: -470, bottom: 0, right: 0)
       
        
        login.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: nil, left: nil, bottom: view.bottomAnchor, right: nil, padd: .init(top: 0, left: 0, bottom: -20, right: 0))
        login.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 0.6
            , constHeight: SIZE.Login_Height)
       
        
        
    }

}







