//
//  DataViewController.swift
//  Notes App
//
//  Created by Sagar Baloch on 11/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    var titleTF:UITextField?
    var subTitleTF:UITextField?
    var notesDetial:UITextField?
    public var completionHandler: ((CellData) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
        setupSubViews()
    }
    
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    fileprivate lazy var titleLable:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Enter New Notes"
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var backButton:UIButton = {
        let button2 = UIButton()
        button2.setTitle("< Back", for: .normal)
        button2.setTitleColor(.black, for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button2
    }()
    
    fileprivate lazy var addButton:UIButton = {
        let button = UIButton()
        button.setTitle("Add Notes", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    @objc func backButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func buttonClicked(){
        if let titleText = titleTF?.text, let subTitleText = subTitleTF?.text, let detailText = notesDetial?.text{
            if titleText.isEmpty,subTitleText.isEmpty,detailText.isEmpty{
                return
            }
            let cell = CellData(context: ViewController.shared.context)
            cell.title = titleText
            cell.subTitle = subTitleText
            cell.notesDetail = detailText
            completionHandler!(cell)
            self.dismiss(animated: true, completion: nil)
        }else{
            return
        }
        
    }
    
    fileprivate func getTextField(height: CGFloat,placeholder:String)->UITextField{
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = placeholder
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: height).isActive = true
        return textField
    }
    
    fileprivate func setupSubViews(){
        self.view.addSubview(titleLable)
        titleLable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 60).isActive = true
        titleLable.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        titleLable.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        titleTF = getTextField(height: 50,placeholder: " Enter Title")
        self.view.addSubview(titleTF!)
        titleTF!.topAnchor.constraint(equalTo: titleLable.topAnchor,constant: 40).isActive = true
        titleTF!.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        titleTF!.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        subTitleTF = getTextField(height: 50,placeholder: " Enter SubTitle")
        self.view.addSubview(subTitleTF!)
        subTitleTF!.topAnchor.constraint(equalTo: titleTF!.bottomAnchor,constant: 40).isActive = true
        subTitleTF!.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        subTitleTF!.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        notesDetial = getTextField(height: 150,placeholder: " Enter Notes")
        self.view.addSubview(notesDetial!)
        notesDetial!.topAnchor.constraint(equalTo: subTitleTF!.bottomAnchor,constant: 40).isActive = true
        notesDetial!.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        notesDetial!.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        self.view.addSubview(addButton)
        addButton.topAnchor.constraint(equalTo: notesDetial!.bottomAnchor,constant: 40).isActive = true
        addButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        addButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
    }
}
