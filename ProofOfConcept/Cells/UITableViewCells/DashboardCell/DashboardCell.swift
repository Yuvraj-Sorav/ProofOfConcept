//
//  DashboardCell.swift
//  ProofOfConcept
//
//  Created by Yuvraj Sorav on 05/03/20.
//  Copyright © 2020 Yuvraj Sorav. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let detailLabel = UILabel()
    let profileImage = UIImageView()
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // configure profileImageView
        contentView.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        //        profileImage.bottomAnchor.constraint(greaterThanOrEqualTo: marginGuide.bottomAnchor, constant: 20).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant:60.0).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        //        profileImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 60, height: 60, enableInsets: false)
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        profileImage.image = #imageLiteral(resourceName: "addTb")
        
        // configure titleLabel
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 5.0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        //FIXME: Added
        nameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40.0).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: Font.kSystemBold, size: 16)
        
        // configure authorLabel
        contentView.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 5.0).isActive = true
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        //FIXME: Added
        detailLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40.0).isActive = true
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont(name: Font.kSystemMedium, size: 12)
        detailLabel.textColor = UIColor.lightGray
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(_ dashboardArr: [DashboardRowsModel], _ indexPath: IndexPath) {
        let dashBoardModel = dashboardArr[indexPath.row]
        nameLabel.text = dashBoardModel.title
        detailLabel.text = dashBoardModel.description
    }
}

