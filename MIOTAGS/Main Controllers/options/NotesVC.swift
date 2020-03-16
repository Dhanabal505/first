//
//  NotesVC.swift
//  MIOTAGS
//
//  Created by Dhanabal on 10/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class NotesVC: UIViewController {

    
    
    lazy var Header:CustomMenuHeader={
        let side = CustomMenuHeader(title: "")
        return side!
    }()
    
    lazy var tableview:UITableView={
        let tv = UITableView()
        tv.separatorStyle = .none
        return tv
    }()
    
    
    lazy var noteslogo:UIImageView={
        let img = UIImageView()
        return img
    }()
    
    lazy var mytitle:CustomLBL={
        let lbl = CustomLBL(title: "Notes")
        return lbl
    }()
    
    
    lazy var back:UIButton={
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "left"), for: .normal)
        return btn
    }()
    
    lazy var addnote:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(named: "notes"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(addnotesact), for: .touchUpInside)
        return btn
    }()
    
    lazy var noteplus:UILabel={
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints=false
        lbl.text = "Add Note"
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return lbl
    }()
    
     var ArrLinks = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        view.addSubview(Header)
        view.addSubview(noteslogo)
        view.addSubview(mytitle)
        view.addSubview(back)
        view.addSubview(tableview)
        view.addSubview(addnote)
        view.addSubview(noteplus)
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
    
    @objc func addnotesact(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddnoteVC") as! AddnoteVC
        navigationController?.pushViewController(vc, animated: true)
        self.addChild(vc)
        vc.view.frame = self.view.frame
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    @objc func handleAddLink(){
        let temp = [String:Any]()
        popAddLink(data: temp,index: "")
    }
    
    func popAddLink(data:[String:Any],index:String){
        let add = AddnoteVC()
        add.myprotocol = self
        add.EditData = data
        add.Index = index
        present(add, animated: true, completion: nil)
    }


    func translate(){
        Header.translatesAutoresizingMaskIntoConstraints=false
        noteslogo.translatesAutoresizingMaskIntoConstraints=false
        mytitle.translatesAutoresizingMaskIntoConstraints=false
        back.translatesAutoresizingMaskIntoConstraints=false
        tableview.translatesAutoresizingMaskIntoConstraints=false
        
    }
    
    func layout(){
        Header.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        Header.anchorWith_Height(height: nil, const: SIZE.Header_Height)
        
        mytitle.anchorWith_XY_Padd(x: noteslogo.centerXAnchor, y: nil)
        mytitle.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: noteslogo.topAnchor, right: nil, padd: .init(top: 0, left: 0, bottom: -20, right: 0))
        
        back.anchorWith_XY_Padd(x: nil, y: mytitle.centerYAnchor)
        back.anchorWith_TopLeftBottomRight_Padd(top: nil, left: nil, bottom: nil, right: mytitle.leadingAnchor , padd: .init(top: 0, left: 0, bottom: 0, right: -5))
        back.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.08, constHeight: 0.03)
        back.imageView?.contentMode = .scaleAspectFit
        
        
        noteslogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        noteslogo.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 120, left: 0, bottom: 0, right: 0))
        noteslogo.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.2, constHeight: 0.1)
        noteslogo.image = UIImage(named: "noteslogo")
        
        addnote.anchorWith_XY_TopLeftBottomRight_Padd(x: noteslogo.centerXAnchor, y: view.centerYAnchor, top: nil, left: nil, bottom: nil, right: nil, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
         addnote.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 0.3, constHeight: 80)
        
        noteplus.anchorWith_XY_Padd(x: addnote.centerXAnchor, y: nil)
        noteplus.anchorWith_TopLeftBottomRight_Padd(top: addnote.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        tableview.anchorWith_TopLeftBottomRight_Padd(top: addnote.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, padd: .init(top: 100, left: 0, bottom: 0, right: 0))
        tableview.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorColor = UIColor.clear
        tableview.register(Notescell.self, forCellReuseIdentifier: "cell")
        tableview.register(buttoncell.self, forCellReuseIdentifier: "cell2")
       
    }
   
}




extension NotesVC: UITableViewDelegate,UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
      print("Section - \(section)")

//        if section == 0{
//
//            return 0
//        }
//        else {
//
//            return 1
//        }
       return ArrLinks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       // if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Notescell
            
            let Notes = ArrLinks[indexPath.row] as! [String : Any]
        
            if let note = Notes["note"] as? String{
                cell.mytxtvw.text = note
           }
            return cell
        }
            
//        else{
//
//             let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! buttoncell
//            cell.addnote.addTarget(self, action: #selector(addnotesact), for: .touchUpInside)
//            print("Section2")
//            return cell
//        }
        
        
   // }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    


}
extension NotesVC:Addnoteprotocol{
    func setnote(strnote: String, index: String) {
        print("received data - \(strnote)")
        
        let data = ["Add Note" : strnote] as [String : Any]
        if index != ""{
            let temp = Int(index)
            ArrLinks.removeObject(at: temp!)
            ArrLinks.insert(data, at: temp!)
        }else{
            ArrLinks.add(data)
        }
        tableview.reloadData()
    }
    
    
}
