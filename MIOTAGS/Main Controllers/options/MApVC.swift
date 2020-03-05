//
//  MApVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 10/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MApVC: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {
    
    let Locationmanager = CLLocationManager()
    
    @IBOutlet weak var gmapicon: UIImageView!
    
    let myview = UIView()
    
      let mapView = MKMapView()
    
    @IBOutlet weak var maplogo: UIImageView!
    
    lazy var Header:CustomMenuHeader={
        let side = CustomMenuHeader(title: "")
        return side!
    }()
    
    
    lazy var back:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "left"), for: .normal)
        return btn
    }()
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "MAPS")
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myview)
        view.addSubview(mapView)
        view.addSubview(Header)
        view.addSubview(mytitle)
        view.addSubview(back)
        translate()
        
        layout()
        
        back.addTarget(self, action: #selector(backact), for: .touchUpInside)
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        
        
        
        
        
        let locStatus = CLLocationManager.authorizationStatus()
        switch locStatus {
        case .notDetermined:
            Locationmanager.requestWhenInUseAuthorization()
            return
        case .denied,.restricted:
            let alert = UIAlertController(title: "Location Services are disabled", message: "Please enable Location Services in your Settings", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        case .authorizedAlways, .authorizedWhenInUse:
            break
        }
    }
        
        
    
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func translate(){
        
        myview.translatesAutoresizingMaskIntoConstraints=false
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
        mapView.translatesAutoresizingMaskIntoConstraints=false
        gmapicon.translatesAutoresizingMaskIntoConstraints=false
        Header.translatesAutoresizingMaskIntoConstraints=false
        maplogo.translatesAutoresizingMaskIntoConstraints=false
    }


    
    func layout(){
        
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        mytitle.anchorWith_XY_Padd(x: maplogo.centerXAnchor, y: nil)
        mytitle.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: maplogo.topAnchor, right: nil, padd: .init(top: 0, left: 0, bottom: -20, right: 0))
        
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        back.imageView?.contentMode = .scaleAspectFit
        
        maplogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        maplogo.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 120, left: 0, bottom: 0, right: 0))
        maplogo.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.2, constHeight: 0.1)
        maplogo.image = UIImage(named: "maplogo")
        
        myview.anchorWith_XY_Padd(x: view.centerXAnchor, y: view.centerYAnchor,padd: .init(top: 50, left: 0, bottom: 0, right: 0))
        myview.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.8, constHeight: 0.35)
        
        
        myview.viewlayout()
        myview.addSubview(mapView)
        
        
        
        mapView.anchorWith_XY_Padd(x: myview.centerXAnchor, y: myview.centerYAnchor)
        mapView.center = view.center
        mapView.anchorWith_WidthHeight(width: myview.widthAnchor, height: myview.heightAnchor, constWidth: 0.95, constHeight: 0.95)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsUserLocation = true
        mapView.layer.cornerRadius = 10
        
        
        
    }

}
