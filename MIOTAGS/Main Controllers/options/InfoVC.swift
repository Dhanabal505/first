//
//  InfoVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 10/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit


class InfoVC: UIViewController {
    
   
    @IBOutlet weak var infologo: UIImageView!
    
    
    lazy var myscroll: UIScrollView = {
        var scroll = UIScrollView()
        return scroll
    }()
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "INFO")
        return lbl
    }()
    
    lazy var back:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "left"), for: .normal)
        return btn
    }()
    
    
    lazy var prpid:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "PropertyId"
        return txtfld
    }()
    lazy var owner:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Owner"
        return txtfld
    }()
    lazy var refcast:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "RefCatastral"
        return txtfld
    }()
    lazy var occup:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Occupado"
        return txtfld
    }()
    lazy var tipolo:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Tipologia"
        return txtfld
    }()
    lazy var situ:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Situaction"
        return txtfld
    }()
    lazy var tipo:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Tipo"
        return txtfld
    }()
    lazy var ano:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Ano"
        return txtfld
    }()
    
    lazy var Estado:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Estado"
        return txtfld
    }()
    
    
    lazy var cons:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "M2cons"
        return txtfld
    }()
    
    
    lazy var utilis:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "M2Utilis"
        return txtfld
    }()
    
    
    lazy var Aseos:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder =  "Aseos"
        return txtfld
    }()
    
    
    lazy var Banyos:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder =  "Banyos"
        return txtfld
    }()
    
    
    lazy var habitac:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Habitac"
        return txtfld
    }()
    
    
    lazy var carplnt:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Carplnt"
        return txtfld
    }()
    
    
    lazy var carpext:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "CarpExtr"
        return txtfld
    }()
    
    
    lazy var comlnc:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Comlnc"
        return txtfld
    }()
    
    
    lazy var Adrs:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Address"
        return txtfld
    }()
    
    
    lazy var City:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "City"
        return txtfld
    }()
    
    
    lazy var state:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "State"
        return txtfld
    }()
    
    
    lazy var zipcode:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "ZipCode"
        return txtfld
    }()
    
    
    lazy var Country:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "Country"
        return txtfld
    }()
    
    
    lazy var prtyweb:UnderlineTf={
        let txtfld = UnderlineTf()
        txtfld.placeholder = "PropertyWebsite"
        return txtfld
    }()
    
    
    lazy var Header:CustomMenuHeader={
        let side = CustomMenuHeader(title: "")
        return side!
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        
        
       view.addSubview(Header)
       view.addSubview(myscroll)
       view.addSubview(mytitle)
        view.addSubview(back)
        
        
       translate()
        layout()
        
        
        
        back.addTarget(self, action: #selector(backact), for: .touchUpInside)
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
    }

    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func translate(){
        
        Header.translatesAutoresizingMaskIntoConstraints=false
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
         myscroll.translatesAutoresizingMaskIntoConstraints=false
        prpid.translatesAutoresizingMaskIntoConstraints=false
        owner.translatesAutoresizingMaskIntoConstraints=false
        occup.translatesAutoresizingMaskIntoConstraints=false
        tipolo.translatesAutoresizingMaskIntoConstraints=false
        situ.translatesAutoresizingMaskIntoConstraints=false
        tipo.translatesAutoresizingMaskIntoConstraints=false
        ano.translatesAutoresizingMaskIntoConstraints=false
        Estado.translatesAutoresizingMaskIntoConstraints=false
        refcast.translatesAutoresizingMaskIntoConstraints=false
        infologo.translatesAutoresizingMaskIntoConstraints=false
        cons.translatesAutoresizingMaskIntoConstraints=false
        utilis.translatesAutoresizingMaskIntoConstraints=false
        Aseos.translatesAutoresizingMaskIntoConstraints=false
        Banyos.translatesAutoresizingMaskIntoConstraints=false
        habitac.translatesAutoresizingMaskIntoConstraints=false
        carpext.translatesAutoresizingMaskIntoConstraints=false
        carplnt.translatesAutoresizingMaskIntoConstraints=false
        comlnc.translatesAutoresizingMaskIntoConstraints=false
        Adrs.translatesAutoresizingMaskIntoConstraints=false
        City.translatesAutoresizingMaskIntoConstraints=false
        state.translatesAutoresizingMaskIntoConstraints=false
        zipcode.translatesAutoresizingMaskIntoConstraints=false
        Country.translatesAutoresizingMaskIntoConstraints=false
        prtyweb.translatesAutoresizingMaskIntoConstraints=false
    }
    func layout(){
        
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        mytitle.anchorWith_XY_Padd(x: infologo.centerXAnchor, y: nil)
        mytitle.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: infologo.topAnchor, right: nil,padd: .init(top: 0, left: 0, bottom: -20, right: 0))
        
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        back.imageView?.contentMode = .scaleAspectFit
        
        infologo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        infologo.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 120, left: 0, bottom: 0, right: 0))
        infologo.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.2, constHeight: 0.1)
        infologo.image = UIImage(named: "infologo")
    
        myscroll.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: infologo.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, padd: .init(top: 80, left: 0, bottom: 0, right: 0))
        myscroll.contentSize.height = 1300
        
        myscroll.backgroundColor = UIColor.clear
        myscroll.addSubview(prpid)
        myscroll.addSubview(owner)
        myscroll.addSubview(refcast)
        myscroll.addSubview(occup)
        myscroll.addSubview(tipolo)
        myscroll.addSubview(situ)
        myscroll.addSubview(tipo)
        myscroll.addSubview(ano)
        myscroll.addSubview(Estado)
        myscroll.addSubview(cons)
        myscroll.addSubview(utilis)
        myscroll.addSubview(Aseos)
        myscroll.addSubview(Banyos)
        myscroll.addSubview(habitac)
        myscroll.addSubview(carplnt)
        myscroll.addSubview(carpext)
        myscroll.addSubview(comlnc)
        myscroll.addSubview(Adrs)
        myscroll.addSubview(City)
        myscroll.addSubview(state)
        myscroll.addSubview(zipcode)
        myscroll.addSubview(Country)
        myscroll.addSubview(prtyweb)
        
        
        
        prpid.anchorWith_XY_TopLeftBottomRight_Padd(x: myscroll.centerXAnchor, y: nil, top: myscroll.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        prpid.anchorWith_Width(width: myscroll.widthAnchor, const: 0.8)
        
        
        owner.anchorWith_TopLeftBottomRight_Padd(top: prpid.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        refcast.anchorWith_TopLeftBottomRight_Padd(top: owner.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        occup.anchorWith_TopLeftBottomRight_Padd(top: refcast.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        
        tipolo.anchorWith_TopLeftBottomRight_Padd(top: occup.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        situ.anchorWith_TopLeftBottomRight_Padd(top: tipolo.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        
        tipo.anchorWith_TopLeftBottomRight_Padd(top: situ.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        
        ano.anchorWith_TopLeftBottomRight_Padd(top: tipo.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        
        Estado.anchorWith_TopLeftBottomRight_Padd(top: ano.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        
        cons.anchorWith_TopLeftBottomRight_Padd(top: Estado.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        utilis.anchorWith_TopLeftBottomRight_Padd(top: cons.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        Aseos.anchorWith_TopLeftBottomRight_Padd(top: utilis.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        Banyos.anchorWith_TopLeftBottomRight_Padd(top: Aseos.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        
        
        habitac.anchorWith_TopLeftBottomRight_Padd(top: Banyos.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        
        carplnt.anchorWith_TopLeftBottomRight_Padd(top: habitac.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        
        
        carpext.anchorWith_TopLeftBottomRight_Padd(top: carplnt.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        comlnc.anchorWith_TopLeftBottomRight_Padd(top: carpext.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        
        Adrs.anchorWith_TopLeftBottomRight_Padd(top: comlnc.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        
        
        City.anchorWith_TopLeftBottomRight_Padd(top: Adrs.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        
        
        state.anchorWith_TopLeftBottomRight_Padd(top: City.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        
        
        zipcode.anchorWith_TopLeftBottomRight_Padd(top: state.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
       
        
        Country.anchorWith_TopLeftBottomRight_Padd(top: zipcode.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        
        prtyweb.anchorWith_TopLeftBottomRight_Padd(top: Country.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
    }
    
    
    
    
}
