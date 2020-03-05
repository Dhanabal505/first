//
//  Notescell.swift
//  MIOTAGS
//
//  Created by Dhanabal on 20/02/20.
//  Copyright © 2020 Dhanabal. All rights reserved.
//

import UIKit

class Notescell: UITableViewCell {
    
    lazy var mytxtvw:UITextView={
        let txtvw = UITextView()
        txtvw.translatesAutoresizingMaskIntoConstraints=false
        txtvw.backgroundColor = UIColor.white
        txtvw.textColor = UIColor.darkText
        return txtvw
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        mytxtvw.layer.cornerRadius = 15
        mytxtvw.layer.borderColor = UIColor().hexToColor(hex: "#4fc3f7").cgColor
        mytxtvw.layer.borderWidth = 5
        mytxtvw.clipsToBounds = true
        mytxtvw.anchorWith_TopLeftBottomRight_Padd(top: self.topAnchor, left: self.leadingAnchor, bottom: nil, right: self.trailingAnchor,padd: .init(top: 10, left: 20, bottom: 0, right: -20))
        mytxtvw.anchorWith_Height(height: self.heightAnchor, const: 0.9)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(mytxtvw)
    }

}


class buttoncell: UITableViewCell{
    
    
    lazy var addnote:UIButton={
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(named: "notes"), for: .normal)
        return btn
    }()
    lazy var noteplus:UILabel={
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints=false
        lbl.text = "Add Note"
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return lbl
    }()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
            addSubview(addnote)
            addSubview(noteplus)
       
            layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func layout() {
        
        addnote.anchorWith_XY_Padd(x: self.centerXAnchor, y: self.centerYAnchor)
        addnote.anchorWith_WidthHeight(width: self.widthAnchor, height: self.widthAnchor, constWidth: 0.2, constHeight: 0.2)
        
        noteplus.anchorWith_XY_Padd(x: addnote.centerXAnchor, y: nil)
        noteplus.anchorWith_TopLeftBottomRight_Padd(top: addnote.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 10, left: 0, bottom: 0, right: 0))
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    
    

}
