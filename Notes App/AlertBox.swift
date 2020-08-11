//
//  File.swift
//  Notes App
//
//  Created by Sagar Baloch on 09/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import UIKit

class AlertBox{
    
    static var shared = AlertBox()
    
    var myView = UIView()
    var stackView = UIStackView()
    var titelText:String?
    var subTitelText:String?
    let textField = UITextField()
    let textField2 = UITextField()
    
    func setupView(controllerView: UIView? = nil){
        guard let mainView:UIView = UIApplication.shared.keyWindow ?? controllerView else {return}
        myView.backgroundColor = .red
        myView.alpha = 0.5
        mainView.addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        myView.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        myView.rightAnchor.constraint(equalTo: mainView.rightAnchor).isActive = true
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        myView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: myView.leftAnchor,constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: myView.rightAnchor,constant: -20).isActive = true
        stackView.centerYAnchor.constraint(equalTo: myView.centerYAnchor).isActive = true
        addSubViews()
    }
    
    func addSubViews(){
        textField.placeholder = "Enter Title"
        textField.backgroundColor = .white
        stackView.addArrangedSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField2.placeholder = "Enter Subtitle"
        textField2.backgroundColor = .white
        stackView.addArrangedSubview(textField2)
        let button = UIButton()
        button.setTitle("Create Notes", for: .normal)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .link
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        stackView.addArrangedSubview(button)
    }
    
    @objc func buttonPressed(){
        let cell = CellData(context: ViewController.shared.context)
        cell.title = textField.text
        cell.subTitle = textField2.text
        ViewController.shared.cellArray.append(cell)
        myView.removeFromSuperview()
        ViewController.shared.saveData()
        ViewController.shared.loadData()
    }
}
