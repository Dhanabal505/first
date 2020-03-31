//
//  Historycell.swift
//  MIOTAGS
//
//  Created by Dhanabal on 29/03/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import Foundation
import UIKit

class Historycell: UITableViewCell {
    
    
    
    lazy var lblUser:UILabel={
        let lbl = UILabel()
        lbl.setCustom(str: "User Name")
        return lbl
    }()
    
    lazy var lblOrganization:UILabel={
        let lbl = UILabel()
        lbl.setCustom(str: "Organization")
        return lbl
    }()
    

    lazy var Date:UILabel={
        let lbl = UILabel()
        lbl.setCustom(str: "Date")
        return lbl
    }()
    
    lazy var Address:UILabel={
        let lbl = UILabel()
        lbl.setCustom(str: "Address")
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
      
        self.addSubview(lblUser)
        self.addSubview(lblOrganization)
        self.addSubview(Date)
        self.addSubview(Address)
        
        setupLayout()
    }
    
    func setupLayout(){

        
        lblUser.anchorWith_TopLeftBottomRight_Padd(top: self.topAnchor, left: self.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 15, left: 15, bottom: 0, right: 0))
        lblUser.anchorWith_Width(width: nil, const: 100)
        lblUser.anchorWith_Height(height: nil, const: 120)
       
        
        lblOrganization.anchorWith_TopLeftBottomRight_Padd(top: self.topAnchor, left:lblUser.trailingAnchor, bottom: nil, right: nil,padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        lblOrganization.anchorWith_Width(width: nil, const: 120)
        lblOrganization.anchorWith_Height(height: nil, const: 120)
        
        
        Date.anchorWith_TopLeftBottomRight_Padd(top: self.topAnchor, left: lblOrganization.trailingAnchor, bottom: nil, right: nil, padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        Date.anchorWith_Width(width: nil, const: 100)
        Date.anchorWith_Height(height: nil, const: 120)
        
        
        Address.anchorWith_TopLeftBottomRight_Padd(top: self.topAnchor, left: Date.trailingAnchor, bottom: nil, right: nil, padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        Address.anchorWith_Width(width: nil, const: 140)
        Address.anchorWith_Height(height: nil, const: 120)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       
    }
    
}
