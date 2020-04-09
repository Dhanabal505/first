//
//  HistoryVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 07/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit
import CoreLocation

class HistoryVC: UIViewController,Settextfielvalue{
    
    
    
    var Hdata:NSArray!

    var Myusername = ""
    
    var MYADDRESS:String?
    
   // var list = ["1", "2", "3"]
    
    var list = Userlist.GETNAME
    
    //var dropdown = UIPickerView()
    
    var button = dropDownBtn()

    lazy var Header:CustomMenuHeader={
        let view = CustomMenuHeader(title: "")
        view?.translatesAutoresizingMaskIntoConstraints=false
        return view!
    }()
    
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "HISTORY")
        return lbl
    }()
    
    
    lazy var Historyimg:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "history")
        return img
    }()
    
    lazy var Myscroll:UIScrollView={
        let scrl = UIScrollView()
        return scrl
    }()
    
    lazy var Mydatascroll:UIScrollView={
        let scrl = UIScrollView()
        return scrl
    }()
    
    lazy var usertf:HistoryTF={
        let tf = HistoryTF()
        tf.placeholder = "Username"
        tf.text = "All"
        tf.isEnabled = false
        tf.textColor = UIColor().hexToColor(hex: "#4fc3f7")
        return tf
    }()

    lazy var FrmDate:HistoryTF={
        let tf = HistoryTF()
        tf.placeholder = "From Date"
        tf.addInputViewDatePicker(target: self, selector: #selector(doneButtonPressed))
        return tf
    }()
    
    lazy var EndDate: HistoryTF={
        let tf = HistoryTF()
        tf.placeholder = "End Date"
        tf.addInputViewDatePicker(target: self, selector: #selector(doneButtonpress))
        return tf
    }()
    
    lazy var Asset:HistoryTF={
        let tf =  HistoryTF()
        tf.placeholder = "Asset ID/UID"
        return tf
    }()
    
    lazy var back:UIButton={
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "left"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(backact), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var search:CustomBTN={
        let btn = CustomBTN(title: "SEARCH")
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(Searchact), for: .touchUpInside)
        return btn
    }()
    
    lazy var dataview:CustomView={
        let view = CustomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var idimg:UIImageView={
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        img.image = UIImage(named: "iddata")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var userimg:UIImageView={
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        img.image = UIImage(named: "userdata")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var dateimg:UIImageView={
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        img.image = UIImage(named: "datedata")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var Adrs:UIImageView={
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        img.image = UIImage(named: "address")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var tblProfile:UITableView={
        let tbl = UITableView()
        tbl.backgroundColor = UIColor.clear
        tbl.translatesAutoresizingMaskIntoConstraints=false
        return tbl
    }()
    
     let Identifiers = "cell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(Myscroll)
        view.addSubview(Header)
       // view.addSubview(dropdown)
        translate()
        layout()
        setTapGesture()
        DropDownbtn()
        print(Userlist.GETNAME)
        
       tblProfile.isHidden = true
     //  dropdown.delegate = self
       // dropdown.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
    }
    
    
    
    func translate(){
      
        Header.translatesAutoresizingMaskIntoConstraints=false
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        Historyimg.translatesAutoresizingMaskIntoConstraints=false
        Myscroll.translatesAutoresizingMaskIntoConstraints=false
        Mydatascroll.translatesAutoresizingMaskIntoConstraints=false
        usertf.translatesAutoresizingMaskIntoConstraints=false
        FrmDate.translatesAutoresizingMaskIntoConstraints=false
        EndDate.translatesAutoresizingMaskIntoConstraints=false
        Asset.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
        //dropdown.translatesAutoresizingMaskIntoConstraints=false
    }
    
    
    func loadTable(){
        tblProfile.delegate=self
        tblProfile.dataSource=self
        
        tblProfile.register(Historycell.self, forCellReuseIdentifier: Identifiers)
        tblProfile.separatorStyle = .none
       
    }
    
    
    
    @objc func backact(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonPressed() {
        if let  datePicker = self.FrmDate.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.FrmDate.text = dateFormatter.string(from: datePicker.date)
        }
        
        self.FrmDate.resignFirstResponder()
       
    }
    func Settextfielvaluemine(string: String) {
        usertf.text = string
        Myusername = string
        usertf.isEnabled = false
    }
    
    @objc func keyboardWillAppear(){
       
        Myscroll.contentSize.height = view.frame.height + 220
        
        let bottomOffSet = CGPoint(x: 0, y: Myscroll.contentSize.height - Myscroll.bounds.size.height + Myscroll.contentInset.bottom)
        Myscroll.setContentOffset(bottomOffSet, animated: true)
        
    }
    @objc func keyboardWillHide(){
        Myscroll.scrollsToTop = true
        Myscroll.contentSize.height = 740
    }
    
    func setTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissed))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    @objc func handleDismissed(){
        self.view.endEditing(true)
    }
    
    func DropDownbtn(){
        button = dropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        //Add Button to the View Controller
        self.Myscroll.addSubview(button)
        
        //button Constraints
        button.anchorWith_TopLeftBottomRight_Padd(top: usertf.bottomAnchor, left: usertf.leadingAnchor, bottom: nil, right: nil, padd: .init(top: -30, left: 10, bottom: 0, right: 0))
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Set the drop down menu's options
        button.dropView.dropDownOptions = Userlist.GETNAME
        button.dropdowndelegete = self
      
    }
    
   
    
//    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
//        return 1
//
//    }
//
//    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
//
//        return list.count
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        self.view.endEditing(true)
//        return list[row]
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//         self.dropdown.isHidden = true
//        self.usertf.text = self.list[row]
//
//
//    }
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//
//        self.dropdown.isHidden = false
//        if textField == self.usertf {
//            self.dropdown.isHidden = false
//            //if you dont want the users to se the keyboard type:
//
//            textField.endEditing(true)
//            usertf.endEditing(true)
//
//
//
//        }
//
//    }
    
    @objc func doneButtonpress(){
        if let  datePicker = self.EndDate.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.EndDate.text = dateFormatter.string(from: datePicker.date)
        }
         self.EndDate.resignFirstResponder()
    }
    
    
    
    @objc func Searchact(){
        validsupport()
        tblProfile.isHidden = false
    }
    
    func validsupport(){
        
        if usertf.text == "All" {
            Myusername = ""
        }else{
            Myusername = usertf.text!
        }
        let StrUName = Myusername
        let FDate = self.FrmDate.text!
        let EDate = self.EndDate.text!
        let ASSETID = Asset.text!
        
        let getdata = ["username":StrUName,"assetId":ASSETID,"fromDate":FDate,"todate":EDate] as [String:String]
        
        print(getdata)
        support(data: getdata)
    }
    
    func support(data:[String:Any]) {
        
        
        let loader = LoaderView()
        loader.showLoader()
        
       
        
        APIs.History(data: data){ (records,error) in
            loader.hideLoader()
            
            
            
            if error != nil{
                switch error {
                case .connectionError?:
                    print("Connection Error")
                    self.makeToast(strMessage: "No Internet Connection")
                    break
                case .noDataAvailable?:
                    print("No Data Available")
                    self.makeToast(strMessage: "No Data Available")
                    break
                case .serverError?:
                    print("Server Error")
                    self.makeToast(strMessage: "Server Error")
                    break
                case .invalidData?:
                    print("Invalid Data")
                    self.makeToast(strMessage: "Server Error")
                    break
                default:
                    print("No Data")
                }
                return
            }
            
            
            
            if let record = records as? String{
                self.makeToast(strMessage: record)
                return
            }
            
            let arrhistory = records as! NSArray
            
            self.Hdata = arrhistory
            
            if arrhistory.count == 1{
                let data = arrhistory[0] as! NSDictionary
                
               // self.redirect(data: data)
            }
            
            
            
            print("Profiles  - \(arrhistory)")
            self.loadTable()
            self.tblProfile.reloadData()
            
            self.Myscroll.contentSize.height = self.Mydatascroll.frame.height + self.tblProfile.frame.size.height
            
            
        }
    }
    
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String,lable:UILabel) {
        
        var addressString = ""
        
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        //21.228124
        let lon: Double = Double("\(pdblLongitude)")!
        //72.833770
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                if let pm = placemarks as? [CLPlacemark] {
                    
                
                
                if pm.count > 0 {
                    let pm = placemarks![0]
                    print(pm.country)
                    print(pm.locality)
                    print(pm.subLocality)
                    print(pm.thoroughfare)
                    print(pm.postalCode)
                    print(pm.subThoroughfare)
                    
                    
                    if pm.subThoroughfare != nil {
                        addressString = addressString + pm.subThoroughfare! + ","
                    }
                    if pm.thoroughfare != nil {
                        addressString = addressString + pm.thoroughfare! + ", "
                    }
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country!
                    }
                    
                    
                    print(addressString)
                    lable.text = addressString
                    
                    
                }
                    
                }
                
                })
        
       // return addressString
    }
}
extension HistoryVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Hdata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers, for: indexPath) as! Historycell
        
        let data = Hdata[indexPath.row] as! NSDictionary
        
        
    
        var name = ""
        if let fname = data["username"]as? String{
            name = fname
            name.append(" ")
        }
        
        cell.lblOrganization.text = name
        
        
    
        
       
       if let contact = data["id"] as? String{
            cell.lblUser.text = contact
       }
        
        var Dateformat = ""
        if let date = data["date"] as? String{
            let mydate = String(date.prefix(10))
            
            let first = String(mydate.suffix(2))
            Dateformat.append(first)
           
            
            let mmyy = String(date.prefix(8))
            let second = String(mmyy.suffix(4))
            Dateformat.append(second)
           
            
            let third = String(mydate.prefix(4))
            Dateformat.append(third)
            
            
            cell.Date.text = Dateformat
        }
        
        
        
        if let lati = data["latittude"] as? String,let long = data["longitude"] as? String{
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
          
            self.getAddressFromLatLon(pdblLatitude: lati, withLongitude: long, lable: cell.Address)
            print(cell.Address.text)
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       return
        

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
extension HistoryVC{
    func layout(){
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        
        
        Myscroll.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: nil, top: Header.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Myscroll.contentSize.height = 740
       
        
        Myscroll.addSubview(mytitle)
        Myscroll.addSubview(Historyimg)
        Myscroll.addSubview(back)
        Myscroll.addSubview(usertf)
        Myscroll.addSubview(FrmDate)
        Myscroll.addSubview(EndDate)
        Myscroll.addSubview(Asset)
        Myscroll.addSubview(search)
        Myscroll.addSubview(Mydatascroll)

        
        
        mytitle.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: Myscroll.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        Historyimg.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: mytitle.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        Historyimg.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.2, constHeight: 0.1)
        
        usertf.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: Historyimg.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 80, left: 0, bottom: 0, right: 0))
        usertf.anchorWith_WidthHeight(width: Myscroll.widthAnchor, height: nil, constWidth: 0.9, constHeight: SIZE.HISTXT_HEIGHT)
        //usertf.addSubview(dropdown)
        
//        dropdown.anchorWith_TopLeftBottomRight_Padd(top: usertf.topAnchor, left: usertf.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 5, left: 10, bottom: 0, right: 0))
//        dropdown.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 100, constHeight: 80)
//        dropdown.backgroundColor = .white
      
        
        FrmDate.anchorWith_TopLeftBottomRight_Padd(top: usertf.bottomAnchor, left: usertf.leadingAnchor, bottom: nil, right: usertf.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        FrmDate.anchorWith_Height(height: usertf.heightAnchor, const: 1)
        
        EndDate.anchorWith_TopLeftBottomRight_Padd(top: FrmDate.bottomAnchor, left: usertf.leadingAnchor, bottom: nil, right: usertf.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        EndDate.anchorWith_Height(height: usertf.heightAnchor, const: 1)
        
        Asset.anchorWith_TopLeftBottomRight_Padd(top: EndDate.bottomAnchor, left: usertf.leadingAnchor, bottom: nil, right: usertf.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        Asset.anchorWith_Height(height: usertf.heightAnchor, const: 1)
        
        back.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: mytitle.centerYAnchor, top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        
        
        search.anchorWith_XY_TopLeftBottomRight_Padd(x: Myscroll.centerXAnchor, y: nil, top: Asset.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        search.anchorWith_WidthHeight(width: Myscroll.widthAnchor, height: nil, constWidth: 0.4, constHeight: SIZE.SEARCH_HEIGHT)
        
        Mydatascroll.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: nil, top: search.bottomAnchor, left: Myscroll.leadingAnchor, bottom: Myscroll.bottomAnchor, right: nil,padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        Mydatascroll.anchorWith_WidthHeight(width: Myscroll.widthAnchor, height: nil, constWidth: 1.5, constHeight: 600)
        Mydatascroll.contentSize = CGSize(width: 700, height: 600)
        Mydatascroll.addSubview(dataview)
        Mydatascroll.addSubview(tblProfile)
        
        dataview.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: nil, top: Mydatascroll.topAnchor, left: Mydatascroll.leadingAnchor
            , bottom: nil, right: nil, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        dataview.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 470 , constHeight: SIZE.DATAVIEW_HEIGHT)
        dataview.addSubview(idimg)
        dataview.addSubview(userimg)
        dataview.addSubview(dateimg)
        dataview.addSubview(Adrs)
        
        
        idimg.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: dataview.centerYAnchor, top: nil, left: dataview.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 0, left: 20, bottom: 0, right: 0))
        idimg.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 40, constHeight: SIZE.DATAIMG_HEIGHT)
        
        
        
        userimg.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: dataview.centerYAnchor, top: nil, left: idimg.trailingAnchor, bottom: nil, right: nil, padd: .init(top: 0, left: 80, bottom: 0, right: 0))
        userimg.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 40, constHeight: SIZE.DATAIMG_HEIGHT)
       
        
        dateimg.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: dataview.centerYAnchor, top: nil, left: userimg.trailingAnchor, bottom: nil, right: nil, padd: .init(top: 0, left: 80, bottom: 0, right: 0))
        dateimg.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 40, constHeight: SIZE.DATAIMG_HEIGHT)
        
        
        Adrs.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: dataview.centerYAnchor, top: nil, left: dateimg.trailingAnchor, bottom: nil, right: nil, padd: .init(top: 0, left: 80, bottom: 0, right: 0))
        Adrs.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 40, constHeight: SIZE.DATAIMG_HEIGHT)
        
        
        tblProfile.anchorWith_XY_TopLeftBottomRight_Padd(x: Mydatascroll.centerXAnchor, y: nil, top: dataview.bottomAnchor, left: Mydatascroll.leadingAnchor, bottom: Myscroll.bottomAnchor, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        tblProfile.anchorWith_WidthHeight(width: nil, height: nil, constWidth:0, constHeight: 600)
        //self.tblProfile.isScrollEnabled = false
    }

}
protocol dropDownProtocol {
    func dropDownPressed(string : String)
}

protocol Settextfielvalue {
    func Settextfielvaluemine (string : String)
}

class dropDownBtn: UIButton, dropDownProtocol {
    
    func dropDownPressed(string: String) {
      //  self.setTitle(string, for: .normal)
        self.dismissDropDown()
        dropdowndelegete!.Settextfielvaluemine(string: string)
        
    }
    
    var dropView = dropDownView()
    
    var dropdowndelegete:Settextfielvalue?
    
    var height = NSLayoutConstraint()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        dropView = dropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource  {
    
    var dropDownOptions = [String]()
    
    var tableView = UITableView()
    
    var delegate : dropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.backgroundColor = UIColor.white
        self.backgroundColor = UIColor.white
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
