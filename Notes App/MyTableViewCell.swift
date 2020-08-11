//
//  MyTableViewCell.swift
//  Notes App
//
//  Created by Sagar Baloch on 09/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    var title = UILabel()
    var subTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        self.heightAnchor.constraint(equalToConstant: 55).isActive = true
        self.addSubview(title)
        title.font = .boldSystemFont(ofSize: 24)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: topAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        self.addSubview(subTitle)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        subTitle.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
