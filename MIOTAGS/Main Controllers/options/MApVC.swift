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
    
    var locationManager:CLLocationManager!
   
    var dest:CLLocationCoordinate2D!
    
    @IBOutlet weak var gmapicon: UIImageView!
    
    let myview = UIView()
    
    var mapView : MKMapView!
    
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
        createmapview()
       
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
            locationManager.requestWhenInUseAuthorization()
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
        determineCurrentLocation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func createmapview(){
        
        mapView = MKMapView()
        mapView.delegate = self
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        view.addSubview(mapView)
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
    
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {

        let sourcePlacemark = MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil)

        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        let sourceAnnotation:MKPointAnnotation = MKPointAnnotation()


        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }

        let destinationAnnotation = MKPointAnnotation()

        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }

        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )

        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .walking
        let selectedPin = MKPlacemark.init(coordinate: dest, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: selectedPin)
        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeWalking]
        mapItem.openInMaps(launchOptions: launchOptions)
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)

        directions.calculate {
            (response, error) -> Void in

            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }

                return
            }

            let route = response.routes[0]

            self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)

            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }

    

    func determineCurrentLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    
       
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationManager.stopUpdatingLocation()
        
        let latitude = Double (Asset.Latitude!)!
        let longtitude = Double(Asset.Longitude!)!
    
            let center = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            
            self.dest = center
            
            mapView.setRegion(region, animated: true)
            
            // Drop a pin at user's Current Location
            let myAnnotation: MKPointAnnotation = MKPointAnnotation()
            myAnnotation.coordinate = CLLocationCoordinate2DMake(latitude,longtitude)
            
        
            myAnnotation.title = "\(Asset.State!)"
            mapView.addAnnotation(myAnnotation)
            
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERROR\(error)")
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let latitude = Double (Asset.Latitude!)!
        let longtitude = Double(Asset.Longitude!)!
        
        
        
        self.locationManager.requestWhenInUseAuthorization()
        
        var currentLocation: CLLocation!
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            currentLocation = self.locationManager.location
            
        }
       
        
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let find = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        
       
        self.showRouteOnMap(pickupCoordinate: center, destinationCoordinate: find)
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
       
        mapView.showsUserLocation = true
        mapView.layer.cornerRadius = 10
        
        
        
    }

}


