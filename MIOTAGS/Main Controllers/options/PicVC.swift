//
//  PicVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 10/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class PicVC: UIViewController,UIImagePickerControllerDelegate , UINavigationControllerDelegate {

  //  @IBOutlet weak var piclogo: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    var x:Int?
   
    
    lazy var myscroll:UIScrollView={
        let scr = UIScrollView()
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        scr.translatesAutoresizingMaskIntoConstraints=false
        scr.contentSize = CGSize(width: screenWidth, height: 1000)
        return scr
    }()
    
    lazy var piclogo:UIImageView={
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        return img
    }()
    
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "PICS")
        return lbl
    }()
    
    
    lazy var Header:CustomMenuHeader={
        let side = CustomMenuHeader(title: "")
        return side!
    }()
    
    
    lazy var picview1:CustomView={
        let view = CustomView()
        return view
    }()
    
    
    lazy var viewimg1:UIImageView={
        let img = UIImageView()
        img.Imglayout()
        return img
    }()
    
    lazy var picview2:CustomView={
        let view = CustomView()
        return view
    }()
    
    lazy var viewimg2:UIImageView={
        let img = UIImageView()
        img.Imglayout()
        return img
    }()
    
    lazy var picview3:CustomView={
        let view = CustomView()
        view.viewlayout()
        return view
    }()
    
    lazy var viewimg3:UIImageView={
        let img = UIImageView()
        img.Imglayout()
        return img
    }()
    
    lazy var back:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "left"), for: .normal)
        return btn
    }()
    
    
    lazy var camerabtn:UIButton={
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "picslogo"), for: .normal)
        return btn
    }()
    
    lazy var camerabtn2:UIButton={
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "picslogo"), for: .normal)
        return btn
    }()
    
    lazy var camerabtn3:UIButton={
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "picslogo"), for: .normal)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         addview()
         translate()
         layout()
        
        
        camerabtn.addTarget(self, action: #selector(camera1act), for: .touchUpInside)
        camerabtn2.addTarget(self, action: #selector(camera2act), for: .touchUpInside)
        camerabtn3.addTarget(self, action: #selector(camera3act), for: .touchUpInside)
        back.addTarget(self, action: #selector(backact), for: .touchUpInside)
        
        
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
       
        viewimg1.addGestureRecognizer(pictureTap)
        viewimg1.isUserInteractionEnabled = true
        viewimg2.addGestureRecognizer(pictureTap)
        viewimg2.isUserInteractionEnabled = true
        viewimg3.addGestureRecognizer(pictureTap)
        viewimg3.isUserInteractionEnabled = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
       
       
    }
    
    
    @objc func camera1act(){
        
        x = 1
       
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
      
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func camera2act(){
      
         x = 2

        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))

        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))

        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))



        self.present(alert, animated: true, completion: nil)
    }


    @objc func camera3act(){
      
         x = 3

        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))

        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))

        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))



        self.present(alert, animated: true, completion: nil)
    }
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary()
    {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if x == 1 {
                print("Btn 1 is clicked")
            viewimg1.contentMode = .scaleToFill
            viewimg1.image = pickedImage
               
        }

          else if x == 2 {
            print("btn 2 click")
            viewimg2.contentMode = .scaleToFill
            viewimg2.image = pickedImage
        }
            else if x == 3 {
                print("btn 3 click")
                viewimg3.contentMode = .scaleToFill
                viewimg3.image = pickedImage
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    func Fullimageview(){
        
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        viewimg1.addGestureRecognizer(pictureTap)
        viewimg1.isUserInteractionEnabled = true
        viewimg2.addGestureRecognizer(pictureTap)
        viewimg2.isUserInteractionEnabled = true
        viewimg3.addGestureRecognizer(pictureTap)
        viewimg3.isUserInteractionEnabled = true
    }
    
    
    
    
    func addview(){
       
        view.addSubview(Header)
        view.addSubview(myscroll)
        myscroll.addSubview(mytitle)
        myscroll.addSubview(back)
        myscroll.addSubview(piclogo)
        myscroll.addSubview(picview1)
        myscroll.addSubview(viewimg1)
        myscroll.addSubview(camerabtn)
        myscroll.addSubview(picview2)
        myscroll.addSubview(viewimg2)
        myscroll.addSubview(camerabtn2)
        myscroll.addSubview(picview3)
        myscroll.addSubview(viewimg3)
        myscroll.addSubview(camerabtn3)
        
    }
    
    func translate(){
        piclogo.translatesAutoresizingMaskIntoConstraints=false
        picview1.translatesAutoresizingMaskIntoConstraints=false
        Header.translatesAutoresizingMaskIntoConstraints=false
        viewimg1.translatesAutoresizingMaskIntoConstraints=false
        camerabtn.translatesAutoresizingMaskIntoConstraints=false
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
        picview2.translatesAutoresizingMaskIntoConstraints=false
        picview3.translatesAutoresizingMaskIntoConstraints=false
        viewimg2.translatesAutoresizingMaskIntoConstraints=false
        viewimg3.translatesAutoresizingMaskIntoConstraints=false
        camerabtn2.translatesAutoresizingMaskIntoConstraints=false
        camerabtn3.translatesAutoresizingMaskIntoConstraints=false
        
    }

    func layout(){
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        myscroll.anchorWith_TopLeftBottomRight_Padd(top: Header.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        mytitle.anchorWith_XY_Padd(x: myscroll.centerXAnchor, y: nil)
        mytitle.anchorWith_TopLeftBottomRight_Padd(top: myscroll.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 50, left: 0, bottom: 0, right: 0))
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        back.imageView?.contentMode = .scaleAspectFit
        
        
        piclogo.centerXAnchor.constraint(equalTo: myscroll.centerXAnchor).isActive=true
        piclogo.anchorWith_TopLeftBottomRight_Padd(top: mytitle.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 50, left: 0, bottom: 0, right: 0))
        piclogo.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.2, constHeight: 0.1)
        piclogo.image = UIImage(named: "picslogo")
        
       
        
        picview1.anchorWith_XY_Padd(x: myscroll.centerXAnchor, y: nil)
        picview1.anchorWith_TopLeftBottomRight_Padd(top: piclogo.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 80, left: 0, bottom: 0, right: 0))
        picview1.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.6, constHeight: 0.2)
        picview1.addSubview(viewimg1)
        picview1.addSubview(camerabtn)  
        
        viewimg1.anchorWith_XY_Padd(x: picview1.centerXAnchor, y: picview1.centerYAnchor)
        viewimg1.anchorWith_WidthHeight(width: picview1.widthAnchor, height: picview1.heightAnchor, constWidth: 0.9, constHeight: 0.9)
        
        camerabtn.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: viewimg1.bottomAnchor, right: viewimg1.trailingAnchor,padd: .init(top: 0, left: 0, bottom: -5, right: -5))
        camerabtn.anchorWith_WidthHeight(width: viewimg1.widthAnchor, height: viewimg1.heightAnchor, constWidth: 0.2, constHeight: 0.2)
        camerabtn.tag = 1
        
        
        picview2.anchorWith_XY_Padd(x: picview1.centerXAnchor, y: nil)
        picview2.anchorWith_TopLeftBottomRight_Padd(top: picview1.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        picview2.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.6, constHeight: 0.2)
        picview2.addSubview(viewimg2)
        picview2.addSubview(camerabtn2)
        
        viewimg2.anchorWith_XY_Padd(x: picview2.centerXAnchor, y: picview2.centerYAnchor)
        viewimg2.anchorWith_WidthHeight(width: picview2.widthAnchor, height: picview2.heightAnchor, constWidth: 0.9, constHeight: 0.9)
        
        camerabtn2.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: viewimg2.bottomAnchor, right: viewimg2.trailingAnchor,padd: .init(top: 0, left: 0, bottom: -5, right: -5))
        camerabtn2.anchorWith_WidthHeight(width: viewimg2.widthAnchor, height: viewimg2.heightAnchor, constWidth: 0.2, constHeight: 0.2)
        camerabtn2.tag = 2
        
        
        picview3.anchorWith_XY_Padd(x: picview1.centerXAnchor, y: nil)
        picview3.anchorWith_TopLeftBottomRight_Padd(top: picview2.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        picview3.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.6, constHeight: 0.2)
        picview3.addSubview(viewimg3)
        picview3.addSubview(camerabtn3)
        
        viewimg3.anchorWith_XY_Padd(x: picview3.centerXAnchor, y: picview3.centerYAnchor)
        viewimg3.anchorWith_WidthHeight(width: picview3.widthAnchor, height: picview3.heightAnchor, constWidth: 0.9, constHeight: 0.9)
        
        camerabtn3.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: viewimg3.bottomAnchor, right: viewimg3.trailingAnchor,padd: .init(top: 0, left: 0, bottom: -5, right: -5))
        camerabtn3.anchorWith_WidthHeight(width: viewimg3.widthAnchor, height: viewimg3.heightAnchor, constWidth: 0.2, constHeight: 0.2)
        camerabtn3.tag = 2
        
    }
   
}
