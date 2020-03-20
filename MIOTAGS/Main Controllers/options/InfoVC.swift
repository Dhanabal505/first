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
    
    
    lazy var prpid:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "PropertyId"
        txtfld.text = Asset.PropertyId
        txtfld.isEnabled = false
        return txtfld
    }()
    lazy var owner:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Owner"
        txtfld.text = Asset.Owner
         txtfld.isEnabled = false
        return txtfld
    }()
    lazy var refcast:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "RefCatastral"
        txtfld.text = Asset.RefCatastral
         txtfld.isEnabled = false
        return txtfld
    }()
    lazy var occup:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Occupado"
        txtfld.text = Asset.Occupado
         txtfld.isEnabled = false
        return txtfld
    }()
    lazy var tipolo:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Tipologia"
        txtfld.text = Asset.Tipologia
         txtfld.isEnabled = false
        return txtfld
    }()
    lazy var situ:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Situaction"
        txtfld.text = Asset.Situaction
         txtfld.isEnabled = false
        return txtfld
    }()
    lazy var tipo:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Tipo"
        txtfld.text = Asset.Tipo
        return txtfld
    }()
    lazy var ano:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Ano"
        txtfld.text = Asset.Ano
         txtfld.isEnabled = false
        return txtfld
    }()
    
    lazy var Estado:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Estado"
        txtfld.text = Asset.Estado
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var cons:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "M2cons"
        txtfld.text = Asset.M2cons
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var utilis:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "M2Utilis"
        txtfld.text = Asset.M2Utilis
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var Aseos:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder =  "Aseos"
        txtfld.text = Asset.Aseos
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var Banyos:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder =  "Banyos"
        txtfld.text = Asset.Banyos
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var habitac:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Habitac"
        txtfld.text = Asset.Habitac
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var carplnt:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Carplnt"
        txtfld.text = Asset.CarpInt
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var carpext:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "CarpExtr"
        txtfld.text = Asset.CarpExtr
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var comlnc:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Comlnc"
        txtfld.text = Asset.ComInc
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var Adrs:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Address"
        txtfld.text = Asset.Address
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var City:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "City"
        txtfld.text = Asset.City
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var state:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "State"
        txtfld.text = Asset.State
        txtfld.addTarget(self, action: #selector(prbtyact), for: .touchDown)
        txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var zipcode:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "ZipCode"
        txtfld.text = Asset.ZipCode
         txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var Country:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "Country"
        txtfld.text = Asset.Country
        txtfld.isEnabled = false
        return txtfld
    }()
    
    
    lazy var prtyweb:InfoTF={
        let txtfld = InfoTF()
        txtfld.placeholder = "PropertyWebsite"
        txtfld.text = Asset.prtyweb
        txtfld.addTarget(self, action: #selector(prbtyact), for: .touchDown)
         txtfld.isEnabled = false
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
    
    @objc func prbtyact(){
        if let url = NSURL(string: Asset.prtyweb!){
            UIApplication.shared.openURL(url as URL)
        }
    
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
        myscroll.contentSize.height = 1200
        
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
        
        
        
        prpid.anchorWith_XY_TopLeftBottomRight_Padd(x: myscroll.centerXAnchor, y: nil, top: myscroll.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        prpid.anchorWith_Width(width: myscroll.widthAnchor, const: 0.8)
        if prpid.text?.count == 0 {
            prpid.anchorWith_Height(height: nil, const: 0)
        }
        
        
        owner.anchorWith_TopLeftBottomRight_Padd(top: prpid.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if owner.text?.count == 0 {
            owner.anchorWith_Height(height: nil, const: 0)
        }
        
        refcast.anchorWith_TopLeftBottomRight_Padd(top: owner.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if refcast.text?.count == 0 {
            refcast.anchorWith_Height(height: nil, const: 0)
        }
        
        occup.anchorWith_TopLeftBottomRight_Padd(top: refcast.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if occup.text?.count == 0 {
            occup.anchorWith_Height(height: nil, const: 0)
        }
        
        tipolo.anchorWith_TopLeftBottomRight_Padd(top: occup.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if tipolo.text?.count == 0 {
            tipolo.anchorWith_Height(height: nil, const: 0)
        }
        
        situ.anchorWith_TopLeftBottomRight_Padd(top: tipolo.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if situ.text?.count == 0 {
            situ.anchorWith_Height(height: nil, const: 0)
        }
        
        
        tipo.anchorWith_TopLeftBottomRight_Padd(top: situ.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if tipo.text?.count == 0 {
            tipo.anchorWith_Height(height: nil, const: 0)
        }
        
        
        ano.anchorWith_TopLeftBottomRight_Padd(top: tipo.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if ano.text?.count == 0 {
            ano.anchorWith_Height(height: nil, const: 0)
        }
        
        
        Estado.anchorWith_TopLeftBottomRight_Padd(top: ano.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if Estado.text?.count == 0 {
            Estado.anchorWith_Height(height: nil, const: 0)
        }
        
        
        cons.anchorWith_TopLeftBottomRight_Padd(top: Estado.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if cons.text?.count == 0 {
            cons.anchorWith_Height(height: nil, const: 0)
        }
        
        utilis.anchorWith_TopLeftBottomRight_Padd(top: cons.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if utilis.text?.count == 0 {
            utilis.anchorWith_Height(height: nil, const: 0)
        }
        
        Aseos.anchorWith_TopLeftBottomRight_Padd(top: utilis.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if Aseos.text?.count == 0 {
            Aseos.anchorWith_Height(height: nil, const: 0)
        }
        
        
        Banyos.anchorWith_TopLeftBottomRight_Padd(top: Aseos.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if Banyos.text?.count == 0 {
            Banyos.anchorWith_Height(height: nil, const: 0)
        }
        
        
        habitac.anchorWith_TopLeftBottomRight_Padd(top: Banyos.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if habitac.text?.count == 0 {
            habitac.anchorWith_Height(height: nil, const: 0)
        }
        
        
        carplnt.anchorWith_TopLeftBottomRight_Padd(top: habitac.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if carplnt.text?.count == 0 {
            carplnt.anchorWith_Height(height: nil, const: 0)
        }
        
        
        carpext.anchorWith_TopLeftBottomRight_Padd(top: carplnt.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if carpext.text?.count == 0 {
            carpext.anchorWith_Height(height: nil, const: 0)
        }
        
        
        comlnc.anchorWith_TopLeftBottomRight_Padd(top: carpext.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if comlnc.text?.count == 0 {
            comlnc.anchorWith_Height(height: nil, const: 0)
        }
        
        
        Adrs.anchorWith_TopLeftBottomRight_Padd(top: comlnc.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if Adrs.text?.count == 0 {
            Adrs.anchorWith_Height(height: nil, const: 0)
        }
        
        
        City.anchorWith_TopLeftBottomRight_Padd(top: Adrs.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if City.text?.count == 0 {
            City.anchorWith_Height(height: nil, const: 0)
        }
        
        
        state.anchorWith_TopLeftBottomRight_Padd(top: City.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if state.text?.count == 0 {
            state.anchorWith_Height(height: nil, const: 0)
        }
        
        
        zipcode.anchorWith_TopLeftBottomRight_Padd(top: state.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if zipcode.text?.count == 0 {
            zipcode.anchorWith_Height(height: nil, const: 0)
        }
        
        Country.anchorWith_TopLeftBottomRight_Padd(top: zipcode.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if Country.text?.count == 0 {
            Country.anchorWith_Height(height: nil, const: 0)
        }
        
        prtyweb.anchorWith_TopLeftBottomRight_Padd(top: Country.bottomAnchor, left: prpid.leadingAnchor, bottom: nil, right: prpid.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        if prtyweb.text?.count == 0 {
            prtyweb.anchorWith_Height(height: nil, const: 0)
        }
    }
    
    
    
    
}
